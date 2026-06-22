param(
    [string]$BaseSwf = $env:BASE_SWF,
    [string]$FfdecCli = $env:FFDEC_CLI,
    [string]$OutFile = "dist\duizhan_build.swf",
    [switch]$ImportAllScripts,
    [switch]$KeepTemp
)

$ErrorActionPreference = 'Stop'
$RepoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $RepoRoot

function Resolve-ToolPath([string]$Given, [string[]]$Candidates, [string]$CommandName, [string]$Label) {
    if ($Given -and (Test-Path -LiteralPath $Given)) { return (Resolve-Path -LiteralPath $Given).Path }
    $cmd = Get-Command $CommandName -ErrorAction SilentlyContinue
    if ($cmd) { return $cmd.Source }
    foreach ($candidate in $Candidates) {
        if ($candidate -and (Test-Path -LiteralPath $candidate)) { return (Resolve-Path -LiteralPath $candidate).Path }
    }
    throw "$Label not found. Pass -$Label or set the matching environment variable."
}

function Resolve-BaseSwf([string]$Given) {
    $candidates = @()
    if ($Given) { $candidates += $Given }
    $candidates += @(
        (Join-Path $RepoRoot 'base.swf'),
        (Join-Path $RepoRoot 'base\base.swf'),
        (Join-Path $RepoRoot '..\base.swf')
    )
    foreach ($candidate in $candidates) {
        if ($candidate -and (Test-Path -LiteralPath $candidate)) { return (Resolve-Path -LiteralPath $candidate).Path }
    }
    throw 'Base SWF not found. Pass -BaseSwf <wrapper-or-decrypted-swf>, set BASE_SWF, or place base.swf in the repo root or base/base.swf.'
}

$BaseSwf = Resolve-BaseSwf $BaseSwf
$FfdecCli = Resolve-ToolPath $FfdecCli @(
    (Join-Path $RepoRoot 'ffdec-cli.exe'),
    (Join-Path $RepoRoot 'tools\ffdec-cli.exe'),
    (Join-Path $RepoRoot 'tools\ffdec\ffdec-cli.exe'),
    (Join-Path $RepoRoot '..\ffdec-cli.exe'),
    (Join-Path $RepoRoot '..\tools\ffdec-cli.exe')
) 'ffdec-cli.exe' 'FfdecCli'
$Python = Resolve-ToolPath $env:PYTHON @() 'python.exe' 'Python'

$BuildDir = Join-Path $RepoRoot 'build'
$OutputPath = if ([System.IO.Path]::IsPathRooted($OutFile)) { $OutFile } else { Join-Path $RepoRoot $OutFile }
$DistDir = Split-Path -Parent $OutputPath
if (-not $DistDir) { $DistDir = $RepoRoot }
New-Item -ItemType Directory -Force -Path $BuildDir | Out-Null
New-Item -ItemType Directory -Force -Path $DistDir | Out-Null

$Helper = Join-Path $BuildDir '_swfwrap.py'
@"
import hashlib
import pathlib
import sys
import zlib

ZERO = b'\x00' * 7

def read_payload(path):
    data = pathlib.Path(path).read_bytes()
    if data[:3] in (b'FWS', b'CWS', b'ZWS'):
        return data, 'plain', data[:3].decode('ascii')
    if len(data) < 8:
        raise SystemExit('input too short')
    payload = zlib.decompress(data[7:])
    if payload[:3] not in (b'FWS', b'CWS', b'ZWS'):
        raise SystemExit('decompressed payload is not SWF')
    return payload, data[:7].hex(' '), payload[:3].decode('ascii')

def main():
    if len(sys.argv) != 4 or sys.argv[1] not in ('decrypt', 'encrypt'):
        raise SystemExit('usage: _swfwrap.py decrypt|encrypt <input> <output>')
    mode, inp, out = sys.argv[1:]
    if mode == 'decrypt':
        payload, head, sig = read_payload(inp)
        pathlib.Path(out).write_bytes(payload)
        print(f'decrypt input={inp}')
        print(f'input_head_or_mode={head}')
        print(f'payload_sig={sig}')
        print(f'payload_sha256={hashlib.sha256(payload).hexdigest()}')
        return
    payload = pathlib.Path(inp).read_bytes()
    if payload[:3] not in (b'FWS', b'CWS', b'ZWS'):
        raise SystemExit('encrypt input is not SWF payload')
    data = ZERO + zlib.compress(payload, level=9)
    pathlib.Path(out).write_bytes(data)
    check = zlib.decompress(data[7:])
    if check != payload:
        raise SystemExit('roundtrip mismatch')
    print(f'encrypt output={out}')
    print('output_head=00 00 00 00 00 00 00')
    print(f'output_sha256={hashlib.sha256(data).hexdigest()}')

if __name__ == '__main__':
    main()
"@ | Set-Content -LiteralPath $Helper -Encoding ASCII

$BasePlain = Join-Path $BuildDir 'base.decrypted.swf'
$PatchedPlain = Join-Path $BuildDir 'patched.decrypted.swf'
$ImportDir = Join-Path $BuildDir 'import-scripts'

Write-Host "[build] repo     : $RepoRoot"
Write-Host "[build] base swf : $BaseSwf"
Write-Host "[build] ffdec    : $FfdecCli"
Write-Host "[build] output   : $OutputPath"
& $Python $Helper decrypt $BaseSwf $BasePlain
if ($LASTEXITCODE -ne 0) { throw 'base decrypt failed' }

if (Test-Path -LiteralPath $ImportDir) { Remove-Item -LiteralPath $ImportDir -Recurse -Force }
if ($ImportAllScripts) {
    Write-Host '[build] import mode: all scripts'
    $ImportDir = Join-Path $RepoRoot 'scripts'
} else {
    Write-Host '[build] import mode: SniperPlayAnimation only'
    $SourceScript = Join-Path $RepoRoot 'scripts\com\taomee\seer2\app\processor\activity\sniper\SniperPlayAnimation.as'
    if (-not (Test-Path -LiteralPath $SourceScript)) { throw "missing patched script: $SourceScript" }
    $TargetScriptDir = Join-Path $ImportDir 'com\taomee\seer2\app\processor\activity\sniper'
    New-Item -ItemType Directory -Force -Path $TargetScriptDir | Out-Null
    Copy-Item -LiteralPath $SourceScript -Destination (Join-Path $TargetScriptDir 'SniperPlayAnimation.as') -Force
}

$env:APPDATA = Join-Path $BuildDir 'ffdec-appdata'
New-Item -ItemType Directory -Force -Path $env:APPDATA | Out-Null
& $FfdecCli -onerror abort -importScript $BasePlain $PatchedPlain $ImportDir
if ($LASTEXITCODE -ne 0) { throw 'FFDec importScript failed' }

& $Python $Helper encrypt $PatchedPlain $OutputPath
if ($LASTEXITCODE -ne 0) { throw 'zero-header encrypt failed' }

if (-not $KeepTemp) {
    Remove-Item -LiteralPath $Helper -Force -ErrorAction SilentlyContinue
}
Write-Host '[build] done'

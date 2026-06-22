param(
    [string]$SourceXml = $env:SOURCE_XML,
    [string]$FfdecCli = $env:FFDEC_CLI,
    [string]$OutFile = "",
    [string[]]$Script = @(),
    [switch]$ImportAllScripts,
    [switch]$NoScriptImport,
    [switch]$KeepTemp
)

$ErrorActionPreference = 'Stop'
$RepoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $RepoRoot
$BuildTimestamp = Get-Date -Format 'yyyyMMdd_HHmmss'

function Resolve-ExistingPath([string]$Given, [string[]]$Candidates, [string]$Label) {
    if ($Given) {
        $path = if ([System.IO.Path]::IsPathRooted($Given)) { $Given } else { Join-Path $RepoRoot $Given }
        if (Test-Path -LiteralPath $path) { return (Resolve-Path -LiteralPath $path).Path }
        throw "$Label not found: $Given"
    }
    foreach ($candidate in $Candidates) {
        if ($candidate -and (Test-Path -LiteralPath $candidate)) {
            return (Resolve-Path -LiteralPath $candidate).Path
        }
    }
    throw "$Label not found."
}

function Resolve-ToolPath([string]$Given, [string[]]$Candidates, [string]$CommandName, [string]$Label) {
    if ($Given) {
        $path = if ([System.IO.Path]::IsPathRooted($Given)) { $Given } else { Join-Path $RepoRoot $Given }
        if (Test-Path -LiteralPath $path) { return (Resolve-Path -LiteralPath $path).Path }
        throw "$Label not found: $Given"
    }
    $cmd = Get-Command $CommandName -ErrorAction SilentlyContinue
    if ($cmd) { return $cmd.Source }
    foreach ($candidate in $Candidates) {
        if ($candidate -and (Test-Path -LiteralPath $candidate)) {
            return (Resolve-Path -LiteralPath $candidate).Path
        }
    }
    throw "$Label not found."
}

function Copy-ScriptForImport([string]$ScriptPath, [string]$ImportRoot) {
    $full = if ([System.IO.Path]::IsPathRooted($ScriptPath)) { $ScriptPath } else { Join-Path $RepoRoot $ScriptPath }
    if (-not (Test-Path -LiteralPath $full)) { throw "script not found: $ScriptPath" }

    $scriptsRoot = (Resolve-Path -LiteralPath (Join-Path $RepoRoot 'scripts')).Path
    $resolved = (Resolve-Path -LiteralPath $full).Path
    if (-not $resolved.StartsWith($scriptsRoot, [System.StringComparison]::OrdinalIgnoreCase)) {
        throw "script must be under scripts/: $ScriptPath"
    }

    $relative = $resolved.Substring($scriptsRoot.Length).TrimStart('\', '/')
    $target = Join-Path $ImportRoot $relative
    New-Item -ItemType Directory -Force -Path (Split-Path -Parent $target) | Out-Null
    Copy-Item -LiteralPath $resolved -Destination $target -Force
}

function Expand-GZipFile([string]$InputPath, [string]$OutputPath) {
    $input = [System.IO.File]::OpenRead($InputPath)
    try {
        $gzip = [System.IO.Compression.GZipStream]::new($input, [System.IO.Compression.CompressionMode]::Decompress)
        try {
            $output = [System.IO.File]::Create($OutputPath)
            try {
                $gzip.CopyTo($output)
            } finally {
                $output.Dispose()
            }
        } finally {
            $gzip.Dispose()
        }
    } finally {
        $input.Dispose()
    }
}

$SourceXml = Resolve-ExistingPath $SourceXml @(
    (Join-Path $RepoRoot 'source\duizhan_622.xml'),
    (Join-Path $RepoRoot 'source\duizhan_622.xml.gz'),
    (Join-Path $RepoRoot 'source.xml')
) 'SourceXml'

$FfdecCli = Resolve-ToolPath $FfdecCli @(
    (Join-Path $RepoRoot 'tools\ffdec\ffdec-cli.exe'),
    (Join-Path $RepoRoot 'tools\ffdec-cli.exe'),
    (Join-Path $RepoRoot 'ffdec-cli.exe')
) 'ffdec-cli.exe' 'FfdecCli'

$BuildDir = Join-Path $RepoRoot 'build'
if ([string]::IsNullOrWhiteSpace($OutFile)) { $OutFile = "dist\duizhan_build_$BuildTimestamp.swf" }
$OutputPath = if ([System.IO.Path]::IsPathRooted($OutFile)) { $OutFile } else { Join-Path $RepoRoot $OutFile }
$DistDir = Split-Path -Parent $OutputPath
if (-not $DistDir) { $DistDir = $RepoRoot }

New-Item -ItemType Directory -Force -Path $BuildDir | Out-Null
New-Item -ItemType Directory -Force -Path $DistDir | Out-Null

$SourceXmlForBuild = $SourceXml
$ExpandedSourceXml = $null
if ($SourceXml.EndsWith('.gz', [System.StringComparison]::OrdinalIgnoreCase)) {
    $ExpandedSourceXml = Join-Path $BuildDir "duizhan_source_$BuildTimestamp.xml"
    Write-Host "[build] expand gz : $SourceXml"
    Expand-GZipFile $SourceXml $ExpandedSourceXml
    $SourceXmlForBuild = $ExpandedSourceXml
}

$ScaffoldSwf = Join-Path $BuildDir "duizhan_xml_$BuildTimestamp.swf"
$PatchedSwf = Join-Path $BuildDir "duizhan_imported_$BuildTimestamp.swf"
$ImportDir = Join-Path $BuildDir "import_$BuildTimestamp"

Write-Host "[build] repo      : $RepoRoot"
Write-Host "[build] source xml: $SourceXml"
Write-Host "[build] ffdec     : $FfdecCli"
Write-Host "[build] output    : $OutputPath"

& $FfdecCli -onerror abort -xml2swf $SourceXmlForBuild $ScaffoldSwf
if ($LASTEXITCODE -ne 0) { throw 'xml2swf failed' }

$FinalPlain = $ScaffoldSwf
if (-not $NoScriptImport) {
    if ($ImportAllScripts) {
        Write-Host '[build] import mode: all scripts'
        $ImportDir = Join-Path $RepoRoot 'scripts'
    } else {
        if ($Script.Count -eq 0) {
            $Script = @('scripts\com\taomee\seer2\app\processor\activity\sniper\SniperPlayAnimation.as')
        }
        Write-Host "[build] import mode: selected scripts ($($Script.Count))"
        if (Test-Path -LiteralPath $ImportDir) { Remove-Item -LiteralPath $ImportDir -Recurse -Force }
        New-Item -ItemType Directory -Force -Path $ImportDir | Out-Null
        foreach ($scriptPath in $Script) {
            Copy-ScriptForImport $scriptPath $ImportDir
            Write-Host "[build] import script: $scriptPath"
        }
    }

    & $FfdecCli -onerror abort -importScript $ScaffoldSwf $PatchedSwf $ImportDir
    if ($LASTEXITCODE -ne 0) { throw 'importScript failed' }
    $FinalPlain = $PatchedSwf
}

Copy-Item -LiteralPath $FinalPlain -Destination $OutputPath -Force
$OutputBytes = [System.IO.File]::ReadAllBytes($OutputPath)
$OutputSig = [System.Text.Encoding]::ASCII.GetString($OutputBytes, 0, 3)
Write-Host "plain output=$OutputPath"
Write-Host "output_sig=$OutputSig"
Write-Host "output_sha256=$((Get-FileHash -LiteralPath $OutputPath -Algorithm SHA256).Hash.ToLowerInvariant())"

if (-not $KeepTemp) {
    Remove-Item -LiteralPath $ScaffoldSwf -Force -ErrorAction SilentlyContinue
    Remove-Item -LiteralPath $PatchedSwf -Force -ErrorAction SilentlyContinue
    if ($ExpandedSourceXml) {
        Remove-Item -LiteralPath $ExpandedSourceXml -Force -ErrorAction SilentlyContinue
    }
    if ((Test-Path -LiteralPath $ImportDir) -and (-not $ImportAllScripts)) {
        Remove-Item -LiteralPath $ImportDir -Recurse -Force -ErrorAction SilentlyContinue
    }
}
Write-Host '[build] done'

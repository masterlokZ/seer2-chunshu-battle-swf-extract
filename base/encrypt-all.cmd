@echo off
setlocal
python -c "import pathlib,sys; p=pathlib.Path(sys.argv[1]); lines=p.read_text(encoding='utf-8').splitlines(); code='\n'.join(lines[lines.index('#PYTHON#')+1:]); exec(compile(code,str(p),'exec'))" "%~f0" encrypt %*
if errorlevel 1 pause
exit /b %errorlevel%
#PYTHON#
import datetime
import pathlib
import sys
import zlib

ZERO = b"\x00" * 7
SWF_SIGS = (b"FWS", b"CWS", b"ZWS")

script_path = pathlib.Path(sys.argv[1]).resolve()
script_dir = script_path.parent
mode = sys.argv[2]
args = sys.argv[3:]

def default_target():
    dist = script_dir.parent / "dist"
    if dist.exists() and any(dist.rglob("*.swf")):
        return dist
    return script_dir

target = pathlib.Path(args[0]).resolve() if args else default_target()
stamp = datetime.datetime.now().strftime("%Y%m%d_%H%M%S")

def classify(path):
    data = path.read_bytes()
    if data[:3] in SWF_SIGS:
        return "plain", data
    if len(data) < 8:
        return "unknown", None
    try:
        payload = zlib.decompress(data[7:])
    except zlib.error:
        return "unknown", None
    if payload[:3] not in SWF_SIGS:
        return "unknown", None
    return "wrapped", payload

def unique_output(path, suffix):
    candidate = path.with_name(f"{path.stem}_{suffix}_{stamp}{path.suffix}")
    index = 2
    while candidate.exists():
        candidate = path.with_name(f"{path.stem}_{suffix}_{stamp}_{index}{path.suffix}")
        index += 1
    return candidate

def iter_swf_files(path):
    if path.is_file():
        return [path] if path.suffix.lower() == ".swf" else []
    if path.is_dir():
        return sorted(path.rglob("*.swf"))
    raise SystemExit(f"target not found: {path}")

files = iter_swf_files(target)
if not files:
    print(f"[encrypt] no swf files under {target}")
    raise SystemExit(0)

print(f"[encrypt] target: {target}")
for path in files:
    kind, payload = classify(path)
    if kind == "wrapped":
        print(f"[skip] already encrypted: {path}")
        continue
    if kind != "plain":
        print(f"[skip] unknown format: {path}")
        continue
    out = unique_output(path, "encrypted")
    wrapped = ZERO + zlib.compress(payload, level=9)
    out.write_bytes(wrapped)
    if zlib.decompress(wrapped[7:]) != payload:
        raise SystemExit(f"roundtrip mismatch: {path}")
    print(f"[ok] encrypted: {path} -> {out}")

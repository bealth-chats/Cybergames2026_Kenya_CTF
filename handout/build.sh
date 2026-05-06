#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
V8_COMMIT="8ab91836885699b9ef686c3a30df4778501ef7d1"
OUT_DIR="out.gn/compact-map-fast"
JOBS="${JOBS:-$(nproc)}"

cd "$ROOT"

if [[ ! -d depot_tools ]]; then
  git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
fi

export PATH="$ROOT/depot_tools:$PATH"

if [[ ! -d v8/.git ]]; then
  fetch --nohooks v8
fi

cd "$ROOT/v8"
git fetch origin "$V8_COMMIT"
git checkout -q -f "$V8_COMMIT"
gclient sync -D -j "$JOBS"

if git apply --check "$ROOT/challenge.patch"; then
  git apply "$ROOT/challenge.patch"
elif git apply -R --check "$ROOT/challenge.patch"; then
  echo "[buildinfo] challenge.patch is already applied"
else
  echo "[buildinfo] challenge.patch does not apply cleanly" >&2
  exit 1
fi

gn gen "$OUT_DIR" --args='
is_debug=false
dcheck_always_on=false
target_cpu="x64"
v8_target_cpu="x64"
v8_enable_pointer_compression=true
v8_enable_sandbox=false
v8_enable_webassembly=true
v8_symbol_level=0
symbol_level=0
treat_warnings_as_errors=false
use_goma=false
'

autoninja -C "$OUT_DIR" d8

echo "d8 is ready ready yay at $ROOT/v8/$OUT_DIR/d8"

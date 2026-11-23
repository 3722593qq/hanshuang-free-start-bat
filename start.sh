#!/usr/bin/env bash
# ============================================================
#  Hanshuang Pojia Tool - one-click launcher (bash)
#  Usage:  ./start.sh
#  Clears ELECTRON_RUN_AS_NODE so electron.exe runs as a GUI
#  app instead of plain Node.
# ============================================================
set -euo pipefail
cd "$(dirname "$0")"

unset ELECTRON_RUN_AS_NODE 2>/dev/null || true

if [ ! -f node_modules/electron/dist/electron.exe ]; then
  echo "[ERROR] electron is not installed. Run: npm install" >&2
  exit 1
fi

if [ ! -f dist/index.html ]; then
  echo "[WARN] dist/ not found, building first..."
  npm run build
fi

exec ./node_modules/electron/dist/electron.exe .

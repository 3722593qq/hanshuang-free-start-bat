@echo off
REM ============================================================
REM  Hanshuang Pojia Tool - one-click launcher
REM  Double-click to start. Clears ELECTRON_RUN_AS_NODE so the
REM  Electron binary runs as a GUI app instead of plain Node.
REM ============================================================
setlocal
cd /d "%~dp0"
set "ELECTRON_RUN_AS_NODE="

if not exist "node_modules\electron\dist\electron.exe" (
  echo [ERROR] electron is not installed.
  echo         Run this once first:  npm install
  echo.
  pause
  exit /b 1
)

if not exist "dist\index.html" (
  echo [WARN] dist\ not found, building first...
  call npm run build
)

start "" "%~dp0node_modules\electron\dist\electron.exe" .
exit /b 0

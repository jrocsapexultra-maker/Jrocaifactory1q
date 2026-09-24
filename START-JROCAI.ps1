$ErrorActionPreference="Stop"
if (!(Test-Path "apps/api/.venv")) { python -m venv apps/api/.venv }
& "apps/api/.venv/Scripts/python.exe" -m pip install -r apps/api/requirements.txt
if (!(Test-Path "apps/api/.env")) { Copy-Item "apps/api/.env.example" "apps/api/.env" }
Start-Process powershell -ArgumentList "-NoExit","-Command","Set-Location '$PWD/apps/api'; & '.venv/Scripts/python.exe' -m uvicorn app.main:app --reload --port 8000"
Set-Location apps/web
npm install
npm run dev

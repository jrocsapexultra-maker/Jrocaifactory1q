# JROCAI FACTORY — ELITE MASTER
A modular AI comic/graphic-novel production platform.

Pipeline:
Story → Director → Character DNA → Continuity → Prompt Engine → Model Router → Workers → QC → Composition → Lettering → Export.

## Windows
PowerShell:
    .\START-JROCAI.ps1

## macOS/Linux
    chmod +x START-JROCAI.sh
    ./START-JROCAI.sh

## Manual
API:
    cd apps/api
    python -m venv .venv
    .venv/Scripts/activate   # Windows
    source .venv/bin/activate # macOS/Linux
    pip install -r requirements.txt
    uvicorn app.main:app --reload --port 8000

Web:
    cd apps/web
    npm install
    npm run dev

Web: http://localhost:3000
API docs: http://localhost:8000/docs

Optional ComfyUI: set COMFYUI_URL in apps/api/.env.
Optional GitHub API: set GITHUB_TOKEN in apps/api/.env.

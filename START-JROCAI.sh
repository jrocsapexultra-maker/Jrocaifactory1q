#!/usr/bin/env bash
set -e
[ -d apps/api/.venv ] || python3 -m venv apps/api/.venv
apps/api/.venv/bin/python -m pip install -r apps/api/requirements.txt
[ -f apps/api/.env ] || cp apps/api/.env.example apps/api/.env
(cd apps/api && .venv/bin/python -m uvicorn app.main:app --reload --port 8000) &
(cd apps/web && npm install && npm run dev)

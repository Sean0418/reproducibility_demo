#!/usr/bin/env bash
set -euo pipefail

# Optional: activate venv if desired
# source .venv/bin/activate || true

PY=python
REQ="artifacts/requirements-gold.txt"
NB="discussion_demo.ipynb"
OUT="discussion_demo.executed.ipynb"

cd "$(dirname "$0")"

# Upgrade pip and install requirements if available
$PY -m pip install --upgrade pip
if [ -f "$REQ" ]; then
  $PY -m pip install -r "$REQ" || true
fi

# Execute the notebook end-to-end
jupyter nbconvert --to notebook --execute "$NB" --output "$OUT"
echo "Done. Artifacts in artifacts/, data in Data/."

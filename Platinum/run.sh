#!/usr/bin/env bash
set -euo pipefail

PY=python
REQ="../Gold/artifacts/requirements-gold.txt"
NB="discussion_demo.ipynb"
OUT="discussion_demo.executed.ipynb"

cd "$(dirname "$0")"

$PY -m pip install --upgrade pip
if [ -f "$REQ" ]; then
  $PY -m pip install -r "$REQ" || true
fi

jupyter nbconvert --to notebook --execute "$NB" --output "$OUT"
echo "Platinum one-button run complete."

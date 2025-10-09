#!/usr/bin/env bash
set -euo pipefail

PY=python
REQ="Gold/artifacts/requirements-gold.txt"
NB="Platinum/discussion_demo.ipynb"
OUT="Platinum/discussion_demo.executed.ipynb"

$PY -m pip install --upgrade pip
if [ -f "$REQ" ]; then
  $PY -m pip install -r "$REQ" || true
fi

jupyter nbconvert --to notebook --execute "$NB" --output "$OUT"
echo "Platinum one-button run complete."

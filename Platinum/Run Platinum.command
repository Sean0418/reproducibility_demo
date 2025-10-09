#!/bin/bash
# macOS double-clickable script to run Platinum end-to-end
# Opens Terminal if double-clicked in Finder and runs the workflow
DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$DIR/.."

# Optionally activate a venv if present
if [ -f ".venv/bin/activate" ]; then
  source .venv/bin/activate
fi

# Execute Platinum one-button run
make -C Platinum all || ./Platinum/run.sh

read -n 1 -s -r -p "\nFinished. Press any key to close..."

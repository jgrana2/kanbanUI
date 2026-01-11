#!/usr/bin/env bash

set -e

# Read the full contents of SYSTEM_PROMPT.md so Cline receives the actual prompt text
SYSTEM_PROMPT="$(cat SYSTEM_PROMPT.md)"

while true; doº
    echo "=== Ralph Loop cycle started ==="

    # Force kill any lingering cline processes to avoid accumulation/hangs
    pkill -f "cline-core.js" || true
    sleep 2

    # Create a fresh Cline instance per cycle
    echo "Creating Cline instance..."
    cline instance new --default

    # Instruct Cline to process ONLY the next failing criterion and then stop
    echo "Executing single-task with Cline..."
    cline task new -y "$SYSTEM_PROMPT"

    # Follow the task progress in real-time
    echo "Following task progress..."
    script -q cline_output.txt cline task view --follow-complete

  echo "=== Loop cycle completed ==="
  sleep 1
done
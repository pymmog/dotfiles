#!/bin/bash
# /home/nero/.config/shutdown_countdown.sh

trap 'echo "Shutdown cancelled."; exit 0' INT
echo "Shutdown in 5 seconds. Ctrl+C to cancel."
for i in {5..1}; do
  echo "$i..."
  sleep 1
done
echo "Shutting down..."
shutdown -h now

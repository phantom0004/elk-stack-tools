#!/bin/bash

# Script to monitor disk usage and alert if usage exceeds threshold

THRESHOLD=80

USAGE=$(df -h / | grep / | awk '{print $5}' | sed 's/%//')

if [ $USAGE -gt $THRESHOLD ]; then
  echo "Disk usage is above $THRESHOLD%. Current usage: $USAGE%."
  # Send alert (e.g., email, Slack message, etc.)
else
  echo "Disk usage is below $THRESHOLD%. Current usage: $USAGE%."
fi

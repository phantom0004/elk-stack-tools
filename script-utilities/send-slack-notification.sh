#!/bin/bash

# Script to send a Slack notification

if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage: $0 <webhook_url> <message>"
  exit 1
fi

WEBHOOK_URL=$1
MESSAGE=$2

payload="{
  \"text\": \"$MESSAGE\"
}"

curl -X POST -H 'Content-type: application/json' --data "$payload" $WEBHOOK_URL

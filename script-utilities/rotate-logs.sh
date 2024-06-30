#!/bin/bash

# Script to rotate Elasticsearch logs

if [ -z "$1" ]; then
  echo "Usage: $0 <index_name>"
  exit 1
fi

INDEX_NAME=$1

echo "Rotating logs for index '$INDEX_NAME'..."
curl -X POST "localhost:9200/$INDEX_NAME/_flush/synced"
echo "Logs for index '$INDEX_NAME' rotated."

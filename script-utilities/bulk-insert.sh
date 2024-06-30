#!/bin/bash

# Script for bulk inserting data into Elasticsearch

if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage: $0 <index_name> <data_file.json>"
  exit 1
fi

INDEX_NAME=$1
DATA_FILE=$2

echo "Bulk inserting data from '$DATA_FILE' into index '$INDEX_NAME'..."
curl -X POST "localhost:9200/$INDEX_NAME/_bulk" -H 'Content-Type: application/x-ndjson' --data-binary @"$DATA_FILE"
echo "Bulk insert completed."

#!/bin/bash

# Script to delete an Elasticsearch index

if [ -z "$1" ]; then
  echo "Usage: $0 <index_name>"
  exit 1
fi

INDEX_NAME=$1

echo "Deleting index '$INDEX_NAME'..."
curl -X DELETE "localhost:9200/$INDEX_NAME"
echo "Index '$INDEX_NAME' deleted."

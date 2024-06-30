#!/bin/bash

# Script to create an Elasticsearch index

if [ -z "$1" ]; then
  echo "Usage: $0 <index_name>"
  exit 1
fi

INDEX_NAME=$1

echo "Creating index '$INDEX_NAME'..."
curl -X PUT "localhost:9200/$INDEX_NAME" -H 'Content-Type: application/json' -d'
{
  "settings": {
    "number_of_shards": 1,
    "number_of_replicas": 0
  },
  "mappings": {
    "properties": {
      "user": {
        "type": "keyword"
      },
      "message": {
        "type": "text"
      },
      "post_date": {
        "type": "date"
      }
    }
  }
}
'
echo "Index '$INDEX_NAME' created."

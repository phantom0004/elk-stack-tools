#!/bin/bash

# Script to retrieve a summary of Elasticsearch indices

echo "Retrieving Elasticsearch index summary..."
curl -X GET "localhost:9200/_cat/indices?v"

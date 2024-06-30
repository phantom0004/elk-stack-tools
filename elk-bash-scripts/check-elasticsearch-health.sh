#!/bin/bash

# Define Elasticsearch host
ES_HOST="http://localhost:9200"

# Check cluster health
echo "Checking Elasticsearch cluster health"
curl -X GET "$ES_HOST/_cluster/health?pretty"

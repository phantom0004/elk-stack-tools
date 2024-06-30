#!/bin/bash

# Check disk usage for Elasticsearch data directory
ES_DATA_DIR="/var/lib/elasticsearch"

# Display disk usage
echo "Checking disk usage for Elasticsearch data directory: $ES_DATA_DIR"
du -sh $ES_DATA_DIR

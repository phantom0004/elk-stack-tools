#!/bin/bash

# Define log file and data locations
ELASTICSEARCH_LOG_DIR="/var/log/elasticsearch"
ELASTICSEARCH_DATA_LOG_DIR="/var/lib/elasticsearch"
LOGSTASH_LOG_DIR="/var/log/logstash"
LOGSTASH_DATA_LOG_DIR="/var/lib/logstash"
KIBANA_LOG_DIR="/var/log/kibana"
KIBANA_DATA_LOG_DIR="/var/lib/kibana"

# Function to clear logs in a directory
clear_logs() {
  local LOG_DIR=$1
  if [ -d "$LOG_DIR" ]; then
    echo "Clearing logs in $LOG_DIR..."
    sudo find $LOG_DIR -type f -name "*.log" -exec rm -f {} \;
    echo "Logs in $LOG_DIR have been cleared."
  else
    echo "Directory $LOG_DIR does not exist."
  fi
}

# Clear Elasticsearch logs
clear_logs $ELASTICSEARCH_LOG_DIR
clear_logs $ELASTICSEARCH_DATA_LOG_DIR

# Clear Logstash logs
clear_logs $LOGSTASH_LOG_DIR
clear_logs $LOGSTASH_DATA_LOG_DIR

# Clear Kibana logs
clear_logs $KIBANA_LOG_DIR
clear_logs $KIBANA_DATA_LOG_DIR

echo "All ELK logs have been cleared."

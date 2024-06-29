#!/bin/bash

# Check status of Elasticsearch service
echo "Checking status of Elasticsearch service..."
sudo timeout 3s systemctl status elasticsearch | head -n 4

echo -e "\n\n"

# Check status of Logstash service
echo "Checking status of Logstash service..."
sudo timeout 3s systemctl status logstash | head -n 4

echo -e "\n\n"

# Check status of Kibana service
echo "Checking status of Kibana service..."
sudo timeout 3s systemctl status kibana | head -n 4

echo -e "\n\n"

echo "Status of Elasticsearch, Logstash, and Kibana have been checked."

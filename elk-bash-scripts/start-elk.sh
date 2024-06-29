#!/bin/bash

# Start Elasticsearch service
sudo systemctl start elasticsearch

# Start Logstash service
sudo systemctl start logstash

# Start Kibana service
sudo systemctl start kibana

# Print confirmation messages
echo "Elasticsearch, Logstash, and Kibana have been started."
echo "Access ELK from - http://localhost:5601"
echo "If you encounter issues, try accessing http://localhost:5601 in an incognito tab."

# Additional information for checking the health status
echo "To check the health status of Elasticsearch, you can use the following command on port 9200:"
echo "curl -u elastic:your_password -X GET 'http://localhost:9200/_cluster/health?pretty'"


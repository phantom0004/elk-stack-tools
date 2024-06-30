#!/bin/bash

echo "Restarting Elasticsearch service..."
sudo systemctl restart elasticsearch

echo "Restarting Logstash service..."
sudo systemctl restart logstash

echo "Restarting Kibana service..."
sudo systemctl restart kibana

echo "Elasticsearch, Logstash, and Kibana have been restarted."

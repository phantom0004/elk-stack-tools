#!/bin/bash

sudo systemctl stop kibana
sudo systemctl stop logstash
sudo systemctl stop elasticsearch

echo "Elasticsearch, Logstash, and Kibana have been stopped."

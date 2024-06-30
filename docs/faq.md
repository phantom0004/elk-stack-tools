# Frequently Asked Questions (FAQ)

## General

### What is the ELK stack?
The ELK stack is a collection of three open-source products—Elasticsearch, Logstash, and Kibana—used for searching, analyzing, and visualizing log data in real time.

## Installation

### How do I install the ELK stack on my system?
Refer to the [Quick Start Guide](quick-start-guide.md) for detailed installation instructions.

## Usage

### How can I check the status of my Elasticsearch cluster?
You can use the following command to check the health of your cluster:
```plaintext
curl -X GET "localhost:9200/_cluster/health?pretty"
```

## Troubleshooting

### What should I do if Elasticsearch is not starting?
Check the Elasticsearch logs located in `/var/log/elasticsearch/` for error messages. Ensure that your configuration files are correct and that there are no port conflicts.

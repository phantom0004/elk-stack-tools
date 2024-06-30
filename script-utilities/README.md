# Script Utilities

This directory contains a collection of utility scripts designed to simplify and enhance the management of your ELK (Elasticsearch, Logstash, Kibana) stack. These scripts are written in Bash and Python, providing a variety of tools to streamline common tasks and improve operational efficiency.

## Available Scripts

- **Bash Scripts**
  - `create-index.sh`: Script to create an Elasticsearch index.
  - `delete-index.sh`: Script to delete an Elasticsearch index.
  - `bulk-insert.sh`: Script for bulk inserting data into Elasticsearch.
  - `monitor-disk-usage.sh`: Script to monitor disk usage and alert if usage exceeds threshold.
  - `send-slack-notification.sh`: Script to send a notification to a Slack channel.
  - `index-summary.sh`: Script to retrieve a summary of Elasticsearch indices.
  - `rotate-logs.sh`: Script to rotate Elasticsearch logs.

- **Python Scripts**
  - `check-elasticsearch-status.py`: Script to check the status of the Elasticsearch cluster.
  - `backup-elasticsearch.py`: Script to create a backup (snapshot) of Elasticsearch data.
  - `restore-elasticsearch.py`: Script to restore data from an Elasticsearch snapshot.
  - `analyze-logs.py`: Script to analyze log files and provide basic statistics.
  - `convert-csv-to-json.py`: Script to convert CSV files to JSON format.

## How to Use

### Bash Scripts

To execute a Bash script, navigate to the directory containing the script and run it using the Bash command:

```bash
bash script-name.sh
```

### Python Scripts

To execute a Python script, ensure you have Python installed and run the script using the Python command:

```bash
python script-name.py
```

## Contribution

Feel free to contribute additional utility scripts that can help in managing and optimizing the ELK stack. Ensure to provide a brief description and usage instructions for any new scripts added.


# Quick Start Guide

## Prerequisites
- Docker installed on your machine.
- Basic understanding of the ELK stack.

## Steps

1. **Clone the repository:**
    ```bash
    git clone https://github.com/phantom0004/elk-stack-tools.git
    cd elk-stack-tools
    ```

2. **Run the Docker Compose setup:**
    ```bash
    docker-compose up -d
    ```

3. **Verify the setup:**
    - Open your browser and go to `http://localhost:5601` to access Kibana.
    - Verify Elasticsearch is running by navigating to `http://localhost:9200`.

4. **Ingest data:**
    - Configure Filebeat to send logs to Logstash using the provided `filebeat.yml` configuration.

5. **View logs in Kibana:**
    - Create an index pattern in Kibana to view your logs.

## Next Steps
- Explore the provided dashboards and visualizations.
- Customize the configuration files to suit your needs.

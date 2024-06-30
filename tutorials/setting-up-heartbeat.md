# Setting Up Heartbeat for Uptime Monitoring

Heartbeat is a lightweight shipper that you can use to monitor the availability of services and endpoints. This tutorial will guide you through the setup and configuration of Heartbeat to monitor your systems.

## Prerequisites

- ELK stack (Elasticsearch, Logstash, Kibana) is installed and running.
- Administrative access to the servers you want to monitor.
- Basic understanding of YAML and ELK stack components.

## Installation

1. **Download and Install Heartbeat:**
   - On Debian-based systems (Ubuntu):
     ```bash
     sudo apt-get install heartbeat-elastic
     ```

   - On Red Hat-based systems (CentOS):
     ```bash
     sudo yum install heartbeat-elastic
     ```

   - Using Docker:
     ```bash
     docker pull docker.elastic.co/beats/heartbeat:7.10.1
     ```

## Configuration

1. **Edit the Heartbeat Configuration File:**
   - The default configuration file is located at `/etc/heartbeat/heartbeat.yml`.
   - Open the file in your favorite text editor.

2. **Configure Monitors:**
   - Define the endpoints to be monitored. Example configuration:
     ```yaml
     heartbeat.monitors:
     - type: http
       schedule: '@every 10s'
       urls: ["http://localhost:9200"]
       check.response.status: 200
     - type: icmp
       schedule: '@every 5s'
       hosts: ["8.8.8.8", "8.8.4.4"]
     ```

3. **Configure Output:**
   - Configure the output to Elasticsearch:
     ```yaml
     output.elasticsearch:
       hosts: ["http://localhost:9200"]
     ```

   - Optionally, configure the output to Logstash:
     ```yaml
     output.logstash:
       hosts: ["localhost:5044"]
     ```

4. **Configure Kibana Setup (Optional):**
   - If you want Heartbeat to configure Kibana dashboards automatically, add the following configuration:
     ```yaml
     setup.kibana:
       host: "localhost:5601"
     ```

## Starting Heartbeat

1. **Start Heartbeat:**
   - On Debian-based systems:
     ```bash
     sudo service heartbeat-elastic start
     ```

   - On Red Hat-based systems:
     ```bash
     sudo systemctl start heartbeat-elastic
     ```

   - Using Docker:
     ```bash
     docker run -d --name=heartbeat \
       --user=root \
       --volume="$(pwd)/heartbeat.yml:/usr/share/heartbeat/heartbeat.yml:ro" \
       docker.elastic.co/beats/heartbeat:7.10.1 heartbeat -e -strict.perms=false
     ```

2. **Enable Heartbeat to Start on Boot:**
   - On Debian-based systems:
     ```bash
     sudo update-rc.d heartbeat-elastic defaults 95 10
     ```

   - On Red Hat-based systems:
     ```bash
     sudo systemctl enable heartbeat-elastic
     ```

## Visualizing Uptime in Kibana

1. **Import Default Dashboards:**
   - Heartbeat comes with pre-built Kibana dashboards. To import these dashboards, run:
     ```bash
     sudo heartbeat setup --dashboards
     ```

2. **Access Dashboards:**
   - Open Kibana and navigate to the "Dashboard" section. You should see a set of dashboards for Heartbeat.

## Conclusion

By following this guide, you have successfully set up Heartbeat to monitor the availability of your services and endpoints. You can visualize the collected data in Kibana using the pre-built dashboards.

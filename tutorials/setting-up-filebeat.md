# Setting Up Filebeat to Collect Logs

Filebeat is a lightweight shipper that you can use to collect and ship log files to Elasticsearch or Logstash. This tutorial will guide you through the setup and configuration of Filebeat to collect log files.

## Prerequisites

- ELK stack (Elasticsearch, Logstash, Kibana) is installed and running.
- Administrative access to the servers you want to monitor.
- Basic understanding of YAML and ELK stack components.

## Installation

1. **Download and Install Filebeat:**
   - On Debian-based systems (Ubuntu):
     ```bash
     sudo apt-get install filebeat
     ```

   - On Red Hat-based systems (CentOS):
     ```bash
     sudo yum install filebeat
     ```

   - Using Docker:
     ```bash
     docker pull docker.elastic.co/beats/filebeat:7.10.1
     ```

## Configuration

1. **Edit the Filebeat Configuration File:**
   - The default configuration file is located at `/etc/filebeat/filebeat.yml`.
   - Open the file in your favorite text editor.

2. **Configure Log Inputs:**
   - Define the log files to be monitored. Example configuration:
     ```yaml
     filebeat.inputs:
     - type: log
       enabled: true
       paths:
         - /var/log/apache2/access.log
         - /var/log/apache2/error.log
       fields:
         log_type: apache
       fields_under_root: true
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
   - If you want Filebeat to configure Kibana dashboards automatically, add the following configuration:
     ```yaml
     setup.kibana:
       host: "localhost:5601"
     ```

## Starting Filebeat

1. **Start Filebeat:**
   - On Debian-based systems:
     ```bash
     sudo service filebeat start
     ```

   - On Red Hat-based systems:
     ```bash
     sudo systemctl start filebeat
     ```

   - Using Docker:
     ```bash
     docker run -d --name=filebeat \
       --user=root \
       --volume="$(pwd)/filebeat.yml:/usr/share/filebeat/filebeat.yml:ro" \
       docker.elastic.co/beats/filebeat:7.10.1 filebeat -e -strict.perms=false
     ```

2. **Enable Filebeat to Start on Boot:**
   - On Debian-based systems:
     ```bash
     sudo update-rc.d filebeat defaults 95 10
     ```

   - On Red Hat-based systems:
     ```bash
     sudo systemctl enable filebeat
     ```

## Visualizing Logs in Kibana

1. **Import Default Dashboards:**
   - Filebeat comes with pre-built Kibana dashboards. To import these dashboards, run:
     ```bash
     sudo filebeat setup --dashboards
     ```

2. **Access Dashboards:**
   - Open Kibana and navigate to the "Dashboard" section. You should see a set of dashboards for Filebeat.

## Conclusion

By following this guide, you have successfully set up Filebeat to collect log files and ship them to Elasticsearch or Logstash. You can visualize the collected logs in Kibana using the pre-built dashboards.

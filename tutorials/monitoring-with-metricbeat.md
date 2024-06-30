# Monitoring with Metricbeat

Metricbeat is a lightweight shipper that you can use to collect and ship system and service metrics to Elasticsearch. This guide will walk you through the setup and configuration of Metricbeat to monitor your systems and services.

## Prerequisites

- ELK stack (Elasticsearch, Logstash, Kibana) is installed and running.
- Administrative access to the servers you want to monitor.
- Basic understanding of YAML and ELK stack components.

## Installation

1. **Download and Install Metricbeat:**
   - On Debian-based systems (Ubuntu):
     ```bash
     sudo apt-get install metricbeat
     ```

   - On Red Hat-based systems (CentOS):
     ```bash
     sudo yum install metricbeat
     ```

   - Using Docker:
     ```bash
     docker pull docker.elastic.co/beats/metricbeat:7.10.1
     ```

## Configuration

1. **Edit the Metricbeat Configuration File:**
   - The default configuration file is located at `/etc/metricbeat/metricbeat.yml`.
   - Open the file in your favorite text editor.

2. **Configure Metric Modules:**
   - Enable and configure the modules you need. Here is an example configuration for system metrics:
     ```yaml
     metricbeat.modules:
     - module: system
       metricsets:
         - cpu
         - memory
         - network
         - process
         - process_summary
         - diskio
       enabled: true
       period: 10s
       processes: ['.*']
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
   - If you want Metricbeat to configure Kibana dashboards automatically, add the following configuration:
     ```yaml
     setup.kibana:
       host: "localhost:5601"
     ```

## Starting Metricbeat

1. **Start Metricbeat:**
   - On Debian-based systems:
     ```bash
     sudo service metricbeat start
     ```

   - On Red Hat-based systems:
     ```bash
     sudo systemctl start metricbeat
     ```

   - Using Docker:
     ```bash
     docker run -d --name=metricbeat \
       --user=root \
       --volume="$(pwd)/metricbeat.yml:/usr/share/metricbeat/metricbeat.yml:ro" \
       --volume="/var/run/docker.sock:/var/run/docker.sock:ro" \
       docker.elastic.co/beats/metricbeat:7.10.1 metricbeat -e -strict.perms=false
     ```

2. **Enable Metricbeat to Start on Boot:**
   - On Debian-based systems:
     ```bash
     sudo update-rc.d metricbeat defaults 95 10
     ```

   - On Red Hat-based systems:
     ```bash
     sudo systemctl enable metricbeat
     ```

## Visualizing Metrics in Kibana

1. **Import Default Dashboards:**
   - Metricbeat comes with pre-built Kibana dashboards. To import these dashboards, run:
     ```bash
     sudo metricbeat setup --dashboards
     ```

2. **Access Dashboards:**
   - Open Kibana and navigate to the "Dashboard" section. You should see a set of dashboards for Metricbeat.

## Monitoring Additional Services

Metricbeat supports various modules for monitoring different services. To enable a module:

1. **Enable the Module:**
   ```bash
   sudo metricbeat modules enable <module_name>
   ```
2. **Configure the Module:**
   Edit the module configuration file located in `/etc/metricbeat/modules.d/`.
3. **Restart Metricbeat:**
    ```bash
   sudo service metricbeat restart
    ```

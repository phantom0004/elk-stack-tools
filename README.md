# ELK Stack Tools and Documentation
![image](https://github.com/phantom0004/elk-stack-tools/assets/42916447/b05c233c-705d-4d73-b2cb-b1e7e3b2bd00)

## Overview
This repository contains tools, scripts, and documentation for managing and using the ELK (Elasticsearch, Logstash, Kibana) stack. These tools help streamline the installation, management, and usage of the ELK stack, making it easier for users to deploy and maintain.

## Table of Contents
- [Installation](#installation)
- [Usage](#usage)
- [Scripts](#scripts)
  - [start-elk.sh](#start-elksh)
  - [stop-elk.sh](#stop-elksh)
  - [restart-elk.sh](#restart-elksh)
  - [check-elk-status.sh](#check-elk-statussh)
  - [clear-elk-logs.sh](#clear-elk-logssh)
- [Examples](#examples)
- [Documentation](#documentation)
- [Contributing](#contributing)
- [License](#license)

---

## Installation

To install the ELK stack on your machine, follow these steps:

### Elasticsearch

1. **Download and install the public signing key:**

    ```
    wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
    ```

2. **Install the apt-transport-https package:**

    ```
    sudo apt-get install apt-transport-https
    ```

3. **Save the repository definition to `/etc/apt/sources.list.d/elastic-7.x.list`:**

    ```
    echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
    ```

4. **Update your package lists and install Elasticsearch:**

    ```
    sudo apt-get update && sudo apt-get install elasticsearch
    ```

5. **Start Elasticsearch and enable it to start on boot:**

    ```
    sudo systemctl enable elasticsearch
    sudo systemctl start elasticsearch
    ```

### Logstash

1. **Install Logstash from the same repository:**

    ```
    sudo apt-get install logstash
    ```

2. **Start Logstash and enable it to start on boot:**

    ```
    sudo systemctl enable logstash
    sudo systemctl start logstash
    ```

### Kibana

1. **Install Kibana from the same repository:**

    ```
    sudo apt-get install kibana
    ```

2. **Start Kibana and enable it to start on boot:**

    ```
    sudo systemctl enable kibana
    sudo systemctl start kibana
    ```

### Verify the Installation

1. **Check Elasticsearch:**

    ```
    curl -X GET "localhost:9200/"
    ```

2. **Check Logstash:**

    ```
    sudo systemctl status logstash
    ```

3. **Check Kibana:**

    Open your web browser and go to `http://localhost:5601`.

Following these steps will install and start the ELK stack on your machine.

---

## Usage

After installing the ELK stack, you can start, stop, and manage services using the provided scripts in this repository. Refer to the Scripts section for details on each script's usage.

---

## Scripts

### start-elk.sh

Script to start Elasticsearch, Logstash, and Kibana services:

```bash
#!/bin/bash

# Start Elasticsearch service
sudo systemctl start elasticsearch

# Start Logstash service
sudo systemctl start logstash

# Start Kibana service
sudo systemctl start kibana

echo "ELK services started successfully."
```

### stop-elk.sh

Script to stop Elasticsearch, Logstash, and Kibana services:

```bash
#!/bin/bash

# Stop Elasticsearch service
sudo systemctl stop elasticsearch

# Stop Logstash service
sudo systemctl stop logstash

# Stop Kibana service
sudo systemctl stop kibana

echo "ELK services stopped."
```

### restart-elk.sh

Script to restart Elasticsearch, Logstash, and Kibana services:

```bash
#!/bin/bash

# Restart Elasticsearch service
sudo systemctl restart elasticsearch

# Restart Logstash service
sudo systemctl restart logstash

# Restart Kibana service
sudo systemctl restart kibana

echo "ELK services restarted."
```

### check-elk-status.sh

Script to check the status of Elasticsearch, Logstash, and Kibana services:

```bash
#!/bin/bash

# Check status of Elasticsearch service
sudo systemctl status elasticsearch | head -n 4

echo -e "\n"

# Check status of Logstash service
sudo systemctl status logstash | head -n 4

echo -e "\n"

# Check status of Kibana service
sudo systemctl status kibana | head -n 4

echo "Status of Elasticsearch, Logstash, and Kibana have been checked."
```

### clear-elk-logs.sh

Script to clear logs for Elasticsearch, Logstash, and Kibana:

```bash
#!/bin/bash

# Function to clear logs in a directory
clear_logs() {
  local LOG_DIR=$1
  if [ -d "$LOG_DIR" ]; then
    echo "Clearing logs in $LOG_DIR..."
    sudo find $LOG_DIR -type f -name "*.log" -exec rm -f {} \;
    echo "Logs in $LOG_DIR have been cleared."
  else
    echo "Directory $LOG_DIR does not exist."
  fi
}

# Clear Elasticsearch logs
clear_logs "/var/log/elasticsearch"
clear_logs "/var/lib/elasticsearch"

# Clear Logstash logs
clear_logs "/var/log/logstash"
clear_logs "/var/lib/logstash"

# Clear Kibana logs
clear_logs "/var/log/kibana"
clear_logs "/var/lib/kibana"

echo "All ELK logs have been cleared."
```

## Examples

### Sample Logstash Configuration

Example Logstash pipeline configuration to parse and index Apache logs:

```plaintext
input {
  file {
    path => "/var/log/apache2/access.log"
    start_position => "beginning"
  }
}

filter {
  grok {
    match => { "message" => "%{COMBINEDAPACHELOG}" }
  }
  date {
    match => [ "timestamp" , "dd/MMM/yyyy:HH:mm:ss Z" ]
  }
}

output {
  elasticsearch {
    hosts => ["localhost:9200"]
    index => "apache-logs"
  }
  stdout { codec => rubydebug }
}
```

### Sample Kibana Dashboard

1. **Open Kibana:** Go to `http://localhost:5601` in your web browser.
2. **Create Index Pattern:** Navigate to `Management > Index Patterns` and create a new index pattern for `apache-logs`.
3. **Import Dashboard:** Go to `Dashboard > Create new dashboard` and start adding visualizations based on your indexed data.

## Documentation

For detailed documentation on installing, configuring, and using the ELK stack, refer to the following resources:

- [Official Elasticsearch Documentation](https://www.elastic.co/guide/en/elasticsearch/reference/current/index.html)
- [Official Logstash Documentation](https://www.elastic.co/guide/en/logstash/current/index.html)
- [Official Kibana Documentation](https://www.elastic.co/guide/en/kibana/current/index.html)
- [ELK Stack Setup Guide](docs/setup-guide.md)
- [ELK Stack Troubleshooting](docs/troubleshooting.md)

## License

This repository is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

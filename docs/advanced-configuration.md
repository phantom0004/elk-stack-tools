# Advanced Configuration Guide

### Custom Configuration
You can customize the settings for Elasticsearch, Kibana, and Logstash by editing their respective configuration files:

- **Elasticsearch:** `elasticsearch.yml` located in `/etc/elasticsearch/`.
- **Kibana:** `kibana.yml` located in `/etc/kibana/`.
- **Logstash:** `logstash.yml` located in `/etc/logstash/`.

**Example Configuration Settings for Elasticsearch:**
```yaml
cluster.name: my-elk-cluster
node.name: node-1
path.data: /var/lib/elasticsearch
path.logs: /var/log/elasticsearch
network.host: 0.0.0.0
http.port: 9200
```

---

### Performance Tuning in Elasticsearch

To optimize the performance of your ELK stack, you can adjust the heap size and configure thread pools in Elasticsearch.

**Heap Size:**

Set the heap size in the `jvm.options` file located in `/etc/elasticsearch/`.

```plaintext
-Xms4g
-Xmx4g
```

**Thread Pool:**

Configure thread pools in the `elasticsearch.yml` file located in `/etc/elasticsearch/`.

Configure thread pools in elasticsearch.yml.
```plaintext
-thread_pool.search.size: 30
-thread_pool.index.size: 30
```

---

### Custom Configurations

## Logstash Custom Configuration

Logstash configuration files are located in `/etc/logstash/conf.d/`.

**Example Input Configuration:**
```yaml
input {
  file {
    path => "/var/log/apache2/access.log"
    start_position => "beginning"
  }
}
```

**Example output configuration:**
```yaml
output {
  elasticsearch {
    hosts => ["localhost:9200"]
  }
  stdout { codec => rubydebug }
}
```

## Kibana Custom Configuration

Kibana settings can be customized in the `kibana.yml` file located in `/etc/kibana/`.

**Example Settings:**
```yaml
server.port: 5601
server.host: "0.0.0.0"
elasticsearch.hosts: ["http://localhost:9200"]
kibana.index: ".kibana"
```

---

## Dashboard Management

Managing your Kibana dashboards is straightforward. Follow these steps to export and import dashboards:

### Export Dashboards

To export dashboards using the Kibana UI:

1. **Open Kibana:** Navigate to your Kibana instance (e.g., `http://localhost:5601`).
2. **Go to Management:** Click on the "Management" tab in the sidebar.
3. **Select Saved Objects:** Under the "Kibana" section, click on "Saved Objects."
4. **Export Objects:** Select the dashboards, visualizations, and searches you want to export, then click on the "Export" button. Save the exported JSON file to your local machine.

### Import Dashboards

To import dashboards using the Kibana UI:

1. **Open Kibana:** Navigate to your Kibana instance (e.g., `http://localhost:5601`).
2. **Go to Management:** Click on the "Management" tab in the sidebar.
3. **Select Saved Objects:** Under the "Kibana" section, click on "Saved Objects."
4. **Import Objects:** Click on the "Import" button, then choose the JSON file you exported previously. Kibana will import the dashboards, visualizations, and searches.

By following these steps, you can easily manage your Kibana dashboards, ensuring they are backed up and can be restored or shared as needed.

import requests

def check_status():
    url = 'http://localhost:9200/_cluster/health'
    response = requests.get(url)
    if response.status_code == 200:
        print("Elasticsearch cluster health:")
        print(response.json())
    else:
        print("Failed to retrieve Elasticsearch cluster health")

if __name__ == "__main__":
    check_status()

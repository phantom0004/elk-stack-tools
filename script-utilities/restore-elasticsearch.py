import requests

def restore_snapshot():
    url = 'http://localhost:9200/_snapshot/my_backup/snapshot_1/_restore?wait_for_completion=true'
    response = requests.post(url)
    print(response.json())

if __name__ == "__main__":
    restore_snapshot()

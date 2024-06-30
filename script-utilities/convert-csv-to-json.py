import csv
import json
import sys

def csv_to_json(csv_file_path, json_file_path):
    data = []
    
    with open(csv_file_path, 'r') as csv_file:
        csv_reader = csv.DictReader(csv_file)
        for row in csv_reader:
            data.append(row)
    
    with open(json_file_path, 'w') as json_file:
        json.dump(data, json_file, indent=4)

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python convert-csv-to-json.py <csv_file_path> <json_file_path>")
        sys.exit(1)
    
    csv_file_path = sys.argv[1]
    json_file_path = sys.argv[2]
    csv_to_json(csv_file_path, json_file_path)

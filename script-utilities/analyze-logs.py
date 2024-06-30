import sys
import re

def analyze_logs(file_path):
    log_counts = {"INFO": 0, "WARN": 0, "ERROR": 0}
    
    with open(file_path, 'r') as file:
        for line in file:
            if "INFO" in line:
                log_counts["INFO"] += 1
            elif "WARN" in line:
                log_counts["WARN"] += 1
            elif "ERROR" in line:
                log_counts["ERROR"] += 1
    
    return log_counts

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python analyze-logs.py <log_file_path>")
        sys.exit(1)
    
    file_path = sys.argv[1]
    stats = analyze_logs(file_path)
    print(f"Log Analysis:\nINFO: {stats['INFO']}\nWARN: {stats['WARN']}\nERROR: {stats['ERROR']}")

#!/bin/bash

# Define snapshot repository
SNAPSHOT_REPO="my_backup_repo"
ES_HOST="http://localhost:9200"
DAYS_OLD=30

# Get a list of old snapshots
SNAPSHOTS=$(curl -s -X GET "$ES_HOST/_snapshot/$SNAPSHOT_REPO/_all" | jq -r ".snapshots[] | select(.start_time_in_millis < now - $DAYS_OLD * 86400000) | .snapshot")

# Delete old snapshots
for SNAPSHOT in $SNAPSHOTS; do
  echo "Deleting old snapshot: $SNAPSHOT"
  curl -X DELETE "$ES_HOST/_snapshot/$SNAPSHOT_REPO/$SNAPSHOT"
done

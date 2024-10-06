#!/bin/bash

# Determine the script directory and project root
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

# Open
URL="https://data.opensanctions.org/datasets/20240615/graph/entities.ftm.json"

# Set destination file in the data folder
DEST_FILE="$PROJECT_ROOT/data/entities.ftm.json"

# Use curl to download the file
echo "Downloading $URL to $DEST_FILE"
curl --compressed -o "$DEST_FILE" "$URL"

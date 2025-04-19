#!/bin/bash

# Hetzner API Key
API_KEY="your_actual_api_key_here"

# Server Details
SERVER_NAME="your_actual_server_name_here"

# Hetzner API URL
API_URL="https://api.hetzner.cloud/v1"

# Function to get server ID
get_server_id() {
    local server_id=$(curl -s \
        -H "Authorization: Bearer $API_KEY" \
        "$API_URL/servers" | jq -r ".servers[] | select(.name == \"$SERVER_NAME\") | .id")

    if [ -z "$server_id" ]; then
        echo "Server not found."
        exit 1
    fi

    echo $server_id
}

# Function to create snapshot
create_snapshot() {
    local server_id=$(get_server_id)
    local snapshot_name="$SERVER_NAME $(date +%d.%m.%y_%H.%M)"

    curl -s -X POST \
        -H "Authorization: Bearer $API_KEY" \
        -H "Content-Type: application/json" \
        -d "{\"description\":\"$snapshot_name\",\"type\":\"snapshot\"}" \
        "$API_URL/servers/$server_id/actions/create_image" | jq -r '.action.status'
}


# Main script
echo "Creating snapshot for server: $SERVER_NAME ($SERVER_HOSTNAME)"
snapshot_status=$(create_snapshot)

if [ "$snapshot_status" == "success" ]; then
    echo "Snapshot created successfully."
else
    echo "Failed to create snapshot. Status: $snapshot_status"
fi

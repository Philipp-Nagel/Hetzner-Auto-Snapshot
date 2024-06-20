# Hetzner Auto-Snapshot


## Overview

This script is designed to create a snapshot of a server using the Hetzner Cloud API. The snapshot can be used for backup or cloning purposes. The script retrieves the server ID using the server name provided and then creates a snapshot with a timestamped description.

## Prerequisites

- **cURL**: Ensure `cURL` is installed on your system.
- **jq**: A lightweight and flexible command-line JSON processor. Install it if you haven't already.
- **Hetzner API Key**: You must have a valid Hetzner API key to authenticate API requests.
- **Server Name**: The name of the server for which you want to create a snapshot.

## Setup

1. **Clone or Download the Script**: Obtain the script file and place it in a desired directory.
2. **Edit the Script**: Open the script in a text editor and replace the placeholders `your_actual_api_key_here` and `your_actual_server_name_here` with your actual Hetzner API key and server name.

## Usage

1. **API Key**: Replace `your_actual_api_key_here` with your Hetzner API key.
2. **Server Name**: Replace `your_actual_server_name_here` with the name of your server.

   Example:
   ```bash
   #!/bin/bash

   # Hetzner API Key
   API_KEY="your_actual_api_key_here"

   # Server Details
   SERVER_NAME="your_actual_server_name_here"

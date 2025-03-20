#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <target_ip> <port_range>"
    echo "Example: $0 182.168.1.1 1-1000"
    exit 1
fi

TARGET=$1
PORT_RANGE=$2

echo "Scanning ports on $TARGET in range $PORT_RANGE..."

IFS="-" read -r START_PORT END_PORT <<< "$PORT_RANGE"

if ! [[ "$START_PORT" =~ ^[0-9]+$ ]] || ! [[ "$END_PORT" =~ ^[0-9]+$ ]] || [ "$START_PORT" -gt "$END_PORT" ]; then
    echo "Invalid port range provided. Please provide a valid range (e.g., 1-1000)."
    exit 1
fi

for ((port=$START_PORT; port<=$END_PORT; port++)); do
    timeout 1 bash -c "echo >/dev/tcp/$TARGET/$port" 2>/dev/null
    if [ $? -eq 0 ]; then
        echo "Port $port is open"
    else
        echo "Port $port is closed"
    fi
done

echo "Scan complete."

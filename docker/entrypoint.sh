#!/bin/bash

IFS=',' read -ra IPS <<< "$ALLOWED_IPS"
for IP in "${IPS[@]}"; do
    echo "Allow $IP" >> /etc/tinyproxy/tinyproxy.conf
done

echo "Running tinyproxy server..."
/usr/bin/tinyproxy -d
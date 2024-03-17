#!/bin/bash

IFS=',' read -ra IPS <<< "$ALLOWED_IPS"
for IP in "${IPS[@]}"; do
    echo "Allow $IP" >> /etc/tinyproxy/tinyproxy.conf
done

if [ "$BASIC_AUTH" = "true" ]; then
  echo "BasicAuth $USERNAME $PASSWORD" >> /etc/tinyproxy/tinyproxy.conf
fi

echo "Running tinyproxy server..."
/usr/bin/tinyproxy -d
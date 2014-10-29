#!/bin/bash

echo "Starting elasticsearch node using supervisord..."
exec /usr/bin/supervisord -n


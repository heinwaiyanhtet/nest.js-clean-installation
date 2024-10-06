#!/bin/bash

# Check if docker-compose is installed
if ! command -v docker compose &> /dev/null
then
    echo "docker compose could not be found. Please install it first."
    exit 1
fi

# Run docker-compose
echo "Starting PostgreSQL service..."
docker compose up -d

# Check if the service started successfully
if [ $? -eq 0 ]; then
    echo "PostgreSQL container started successfully."
else
    echo "Failed to start PostgreSQL container."
fi

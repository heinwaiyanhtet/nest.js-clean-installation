#!/bin/bash

HOST_PORT=27018 
DB_USERNAME="admin"
DB_PASSWORD="password"
MONGODB_CONTAINER_NAME="mongodb-container"

echo "Starting MongoDB container..."
docker-compose up -d

if [ "$(docker ps -q -f name=$MONGODB_CONTAINER_NAME)" ]; then
    echo "MongoDB container is up and running."
else
    echo "Failed to start MongoDB container."
    exit 1
fi

MONGODB_URL="mongodb://$DB_USERNAME:$DB_PASSWORD@localhost:$HOST_PORT"
echo "MongoDB connection URL: $MONGODB_URL"

#!/bin/bash

# Variables (adjust as needed)
IMAGE_NAME="nestjs-ubuntu-app"
CONTAINER_NAME="nestjs-container"
PORT=3000

echo "Building Docker image for Nest.js..."
docker build -t $IMAGE_NAME .

if [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then
    echo "Stopping and removing existing container..."
    docker stop $CONTAINER_NAME
    docker rm $CONTAINER_NAME
fi

echo "Running Docker container for Nest.js..."
docker run -d --name $CONTAINER_NAME \
    -p $PORT:$PORT \
    $IMAGE_NAME

echo "Container status:"
docker ps | grep $CONTAINER_NAME

echo "Nest.js container is up and running on port $PORT."

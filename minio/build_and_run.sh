#!/bin/bash

IMAGE_NAME="minio-ubuntu"
CONTAINER_NAME="minio-container"
MINIO_PORT_API=9000
MINIO_PORT_CONSOLE=9001

echo "Building Docker image for MinIO..."
docker build -t $IMAGE_NAME .

if [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then
    echo "Stopping and removing existing container..."
    docker stop $CONTAINER_NAME
    docker rm $CONTAINER_NAME
fi

echo "Running Docker container for MinIO..."
docker run -d --name $CONTAINER_NAME \
    -p $MINIO_PORT_API:9000 \
    -p $MINIO_PORT_CONSOLE:9001 \
    $IMAGE_NAME

echo "Container status:"
docker ps | grep $CONTAINER_NAME

echo "MinIO container is up and running."
echo "Access MinIO Storage API: http://localhost:$MINIO_PORT_API"
echo "Access MinIO Console: http://localhost:$MINIO_PORT_CONSOLE"

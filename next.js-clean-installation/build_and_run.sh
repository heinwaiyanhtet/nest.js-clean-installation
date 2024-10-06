#!/bin/bash

IMAGE_NAME="nextjs-app"
CONTAINER_NAME="nextjs-container"
PORT=3002

echo "Building Docker image..."
docker build -t $IMAGE_NAME .

if [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then
    echo "Stopping and removing existing container..."
    docker stop $CONTAINER_NAME
    docker rm $CONTAINER_NAME
fi

# Step 3: Run the Docker container
echo "Running Docker container..."
docker run -d --name $CONTAINER_NAME -p $PORT:$PORT $IMAGE_NAME

# Step 4: Show the status of the running container
echo "Container status:"
docker ps | grep $CONTAINER_NAME

echo "Next.js container is up and running on port $PORT."

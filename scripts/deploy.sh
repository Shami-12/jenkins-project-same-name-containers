#!/bin/bash

BASE_NAME="my-app"
IMAGE_NAME="my-app-image"

echo "Building Docker image..."
docker build -t $IMAGE_NAME ./docker

echo "Cleaning old containers..."
for i in 1 2 3
do
  docker stop ${BASE_NAME}-$i 2>/dev/null || true
  docker rm ${BASE_NAME}-$i 2>/dev/null || true
done

echo "Starting new containers..."

PORT=8081

for i in 1 2 3
do
  docker run -d \
    -p $PORT:80 \
    --name ${BASE_NAME}-$i \
    $IMAGE_NAME

  echo "Started ${BASE_NAME}-$i on port $PORT"

  PORT=$((PORT+1))
done

echo "✅ Deployment complete!"

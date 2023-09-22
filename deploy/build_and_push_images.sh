#!/bin/bash

# Docker Hub username
DOCKERHUB_USERNAME="mithun100"

# Image tag for the Docker images
IMAGE_TAG="latest"

# Build and push downstream application Docker image
echo "Building downstream-app Docker image..."
docker build --no-cache -t "${DOCKERHUB_USERNAME}/go-downstream-app:${IMAGE_TAG}" -f ../downstream_app/Dockerfile ../downstream_app

echo "Pushing downstream-app Docker image..."
docker push "${DOCKERHUB_USERNAME}/go-downstream-app:${IMAGE_TAG}"

# Build and push upstream application Docker image
echo "Building upstream-app Docker image..."
docker build --no-cache -t "${DOCKERHUB_USERNAME}/go-upstream-app:${IMAGE_TAG}" -f ../upstream_app/Dockerfile ../upstream_app

echo "Pushing upstream-app Docker image..."
docker push "${DOCKERHUB_USERNAME}/go-upstream-app:${IMAGE_TAG}"

# echo "Building loadgen"
# docker build --no-cache -t "${DOCKERHUB_USERNAME}/loadgen-image:${IMAGE_TAG}" -f ../loadgen/Dockerfile ../loadgen
#
# echo "Pushing loadgent Docker image..."
# docker push "${DOCKERHUB_USERNAME}/loadgen-image:${IMAGE_TAG}"

echo "Images have been built and pushed to Docker Hub successfully!"
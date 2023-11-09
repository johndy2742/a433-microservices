#!/bin/bash

# Define GitHub username, repository name, image name, and tag
GITHUB_USERNAME="johndy2742"
REPO_NAME="a433-microservices"
IMAGE_NAME="karsajobs"
TAG="latest"

# Build the Docker image (replace with your build process)
docker build -t ${IMAGE_NAME}:${TAG} .

# Tag the image for GitHub Container Registry (ghcr.io)
docker tag ${IMAGE_NAME}:${TAG} ghcr.io/${GITHUB_USERNAME}/${REPO_NAME}/${IMAGE_NAME}:${TAG}

# Log in to GitHub Container Registry using your GitHub PAT
docker login ghcr.io -u ${GITHUB_USERNAME} -p ${TOKEN}

# Push the Docker image to GitHub Container Registry
docker push ghcr.io/${GITHUB_USERNAME}/${REPO_NAME}/${IMAGE_NAME}:${TAG}

# Clean up
docker logout ghcr.io

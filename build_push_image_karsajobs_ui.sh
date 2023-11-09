#!/bin/bash

# Define GitHub username, repository name, image name, and tag
GITHUB_USERNAME="johndy2742"
REPO_NAME="a433-microservices"
IMAGE_NAME="karsajobs-ui"
TAG="latest"

# Load your GitHub Personal Access Token (PAT) from .env file
if [[ -f .env ]]; then
  source .env
else
  echo "Please create a .env file with your GITHUB_TOKEN." && exit 1
fi

# Build the Docker image
docker build -t ${IMAGE_NAME}:${TAG} .

# Tag the image for GitHub Container Registry (ghcr.io)
docker tag ${IMAGE_NAME}:${TAG} ghcr.io/${GITHUB_USERNAME}/${REPO_NAME}/${IMAGE_NAME}:${TAG}

# Log in to GitHub Container Registry using your GitHub PAT
docker login ghcr.io -u ${GITHUB_USERNAME} -p ${GITHUB_TOKEN}

# Push the Docker image to GitHub Container Registry
docker push ghcr.io/${GITHUB_USERNAME}/${REPO_NAME}/${IMAGE_NAME}:${TAG}

# Clean up
docker logout ghcr.io

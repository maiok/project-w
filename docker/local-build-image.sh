#!/usr/bin/env bash

# load environment variables
source .env

# temporary copy requirements.txt to the docker folder
cp ../requirements.txt .

# both platofrms build (x86 and arm)
docker buildx build --platform=linux/amd64 -t ${PROJECT_W_IMAGE_NAME_X86} .
docker buildx build --platform=linux/arm64 -t ${PROJECT_W_IMAGE_NAME_ARM} .

# remove requirements.txt from the docker folder
rm requirements.txt
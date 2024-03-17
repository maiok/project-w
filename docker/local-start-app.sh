#!/usr/bin/env bash

# load environment variables
source .env

printf "\nStop running services...\n"
docker stop ${PROJECT_W_NAME}
docker rm ${PROJECT_W_NAME}

printf "\nBuild docker app...\n"
./local-build-image.sh

printf "\nRun app...\n"
docker run --name ${PROJECT_W_NAME} -p ${PROJECT_W_HOST_PORT}:5000 -d ${PROJECT_W_IMAGE_NAME}

printf "\nApp was started...\ngl&hf\n\n"
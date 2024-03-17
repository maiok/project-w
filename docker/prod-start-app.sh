#!/usr/bin/env bash

# load environment variables
source .env

printf "\nStop running services...\n"
docker stop ${PROJECT_W_NAME}
docker rm ${PROJECT_W_NAME}

printf "\Pull docker image...\n"
docker pull ${PROJECT_W_IMAGE_NAME}

printf "\nRun app services...\n"
docker run --name ${PROJECT_W_NAME} -p ${PROJECT_W_HOST_PORT}:5000 -d ${PROJECT_W_IMAGE_NAME}

printf "\nApp was started...\ngl&hf\n\n"
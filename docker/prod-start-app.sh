#!/usr/bin/env bash

# load environment variables
source .env

printf "\nStop running services...\n"
docker stop ${PROJECT_W_NAME}
docker rm ${PROJECT_W_NAME}

printf "\nPrihlasujem sa do GitHub Packages...\n"
echo ${GITHUB_PAT} | docker login ${GITHUB_PACKAGES_URL} -u ${GITHUB_USERNAME} --password-stdin

printf "\nPull docker image...\n"
docker image pull ${PROJECT_W_IMAGE_NAME}

printf "\nRun app services...\n"
docker run --name ${PROJECT_W_NAME} -p ${PROJECT_W_HOST_PORT}:5000 -d ${PROJECT_W_IMAGE_NAME}

printf "\nLogout from GitHub Packages...\n"
docker logout ${GITHUB_PACKAGES_URL}

printf "\nApp was started...\ngl&hf\n\n"
#!/usr/bin/env bash

# load environment variables
source .env

printf "\nStop running services...\n"
docker compose down

printf "\nPrihlasujem sa do GitHub Packages...\n"
echo ${GITHUB_PAT} | docker login ${GITHUB_PACKAGES_URL} -u ${GITHUB_USERNAME} --password-stdin

printf "\nPull docker image...\n"
docker image pull ${PROJECT_W_IMAGE_NAME}

printf "\nRun app services...\n"
docker compose --project-name ${PROJECT_W_NAME}-app up -d

printf "\nLogout from GitHub Packages...\n"
docker logout ${GITHUB_PACKAGES_URL}

printf "\nApp was started...\ngl&hf\n\n"
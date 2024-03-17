#!/usr/bin/env bash

# load environment variables
source .env

printf "\nStop running services...\n"
docker compose down

printf "\nBuild docker app...\n"
./local-build-image.sh

printf "\nRun app...\n"
docker compose --project-name ${PROJECT_W_NAME}-app up -d

printf "\nApp was started...\ngl&hf\n\n"
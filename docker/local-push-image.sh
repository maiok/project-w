#!/usr/bin/env bash

# load environment variables
source .env

printf "\nPrihlasujem sa do GitHub Packages...\n"
echo ${GITHUB_PAT} | docker login ${GITHUB_PACKAGES_URL} -u ${GITHUB_USERNAME} --password-stdin

printf "\nBuildujem docker aplikaciu...\n"
./local-build-image.sh

printf "\nPushujem docker aplikaciu...\n"
docker push ${PROJECT_W_IMAGE_NAME_X86}:latest
docker push ${PROJECT_W_IMAGE_NAME_ARM}:latest

docker logout ${GITHUB_PACKAGES_URL}
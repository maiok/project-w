#!/usr/bin/env bash

PROJECT_W_IMAGE_NAME="project-w-image"
PROJECT_W_CONTAINER_NAME="project-w"

printf "\nZastavujem beziace sluzby...\n"
docker stop $PROJECT_W_CONTAINER_NAME
docker rm $PROJECT_W_CONTAINER_NAME

printf "\nBuildujem docker aplikaciu...\n"
docker build -t $PROJECT_W_IMAGE_NAME .

printf "\nSpustam aplikaciu...\n"
docker run --name $PROJECT_W_CONTAINER_NAME -p 5001:5000 -d $PROJECT_W_IMAGE_NAME

printf "\nAplikacia bola spustena\ngl&hf\n\n"
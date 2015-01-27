#!/bin/bash
CONTAINER_NAME=registry
IMAGE=registry:latest
NGINX_CONTAINER_NAME=nginx
IP=192.168.42.70/24

docker rm -f $CONTAINER_NAME
docker pull $IMAGE
docker run --name=$CONTAINER_NAME -d $IMAGE
contnet attach $CONTAINER_NAME $IP

#!/bin/bash
CONTAINER_NAME=cookie
IMAGE=registry.eztwo.com:5042/cookieserver
IP=192.168.42.20/24

docker rm -f $CONTAINER_NAME
docker pull $IMAGE
docker run \
 --name=$CONTAINER_NAME \
 --add-host="es:$(contnet ip es)" \
 -e "BASE_URL=http://cookie.eztwo.com" \
 -e "PICTURES_PATH=/cookie/pics" \
 -v /usr/data/cookie/pics:/cookie/pics \
 -d \
 $IMAGE
contnet attach $CONTAINER_NAME $IP

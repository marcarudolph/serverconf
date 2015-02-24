#!/bin/bash
CONTAINER_NAME=cookiebackup
IMAGE=registry.eztwo.com:5042/cookiebackup
IP=192.168.42.70/24

docker rm -f $CONTAINER_NAME
docker pull $IMAGE
docker run \
 --name=$CONTAINER_NAME \
 --add-host="es:$(contnet ip es)" \
 -v /usr/serverconf/backup/.dropbox_uploader:/cfg/.dropbox_uploader \
 -v /usr/data/cookie/pics:/cookie/pics \
 -v /usr/data/es/backup/cookie:/cookie/backup \
 -d \
 $IMAGE
contnet attach $CONTAINER_NAME $IP

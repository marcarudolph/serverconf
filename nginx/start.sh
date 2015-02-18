#!/bin/bash
CONTAINER_NAME=nginx
IMAGE=nginx:1.7.9
IP=192.168.42.1/24

docker rm -f $CONTAINER_NAME
docker pull $IMAGE
docker run --name $CONTAINER_NAME \
 -v /var/log/nginx:/var/log/nginx \
 -v /usr/serverconf/nginx/cfg/:/etc/nginx/conf.d/ \
 -v /usr/serverconf/nginx/html:/var/www/html \
 --add-host="es:$(contnet ip es)" \
 --add-host="cookie:$(contnet ip cookie)" \
 --add-host="registry:$(contnet ip registry)" \
 -p 80:80 \
 -p 443:443 \
 -p 5042:5042 \
 -p 9243:9243 \
 -d \
 $IMAGE

contnet attach $CONTAINER_NAME $IP

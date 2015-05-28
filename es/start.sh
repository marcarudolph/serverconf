#!/bin/bash
CONTAINER_NAME=es
IMAGE=elasticsearch:1.4
IP=192.168.42.10/24

docker rm -f $CONTAINER_NAME
docker pull $IMAGE
docker run \
 --name=$CONTAINER_NAME \
 -e "ES_HEAP_SIZE=128m" \
 -e "ES_JAVA_OPTS=-server" \
 -v /usr/serverconf/es/elasticsearch.yml:/usr/share/elasticsearch/config/elasticsearch.yml \
 -v /usr/data/es:/es \
 -d \
 $IMAGE
contnet attach $CONTAINER_NAME $IP

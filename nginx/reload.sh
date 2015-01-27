#!/bin/bash

CID=$(docker ps | grep "nginx" | awk '{print $1}')
docker kill --signal=HUP $CID

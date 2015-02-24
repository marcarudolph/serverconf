#!/bin/bash
curl -XPUT 'http://es:9242/_snapshot/cookie_backup' -d '{
    "type": "fs",
    "settings": {
        "compress" : true,
        "location": "/es/backup/cookie"
    }
}'
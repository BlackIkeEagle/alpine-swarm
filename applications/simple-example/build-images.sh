#!/usr/bin/env sh

set -e

docker pull dockerwest/php:7.2
docker pull nginx:alpine

docker build --no-cache -f Dockerfile-nginx -t blackikeeagle/swarm-sample-nginx .
docker build --no-cache -f Dockerfile-php -t blackikeeagle/swarm-sample-php .

docker push blackikeeagle/swarm-sample-nginx
docker push blackikeeagle/swarm-sample-php

#!/usr/bin/env sh

echo "export DOCKER_HOST=tcp://192.168.250.31:2375"
echo "export DOCKER_CERT_PATH=$(pwd)/client-cert"
echo "export DOCKER_TLS_VERIFY=1"


#!/usr/bin/env sh

set -e

if [ -d client-cert ]; then
    rm -r client-cert
fi
if [ -d server-cert ]; then
    rm -r server-cert
fi
./init-vagrant.sh
vagrant up
./create-certs.sh
./init-swarm.sh


#!/usr/bin/env sh

set -e

./init-vagrant.sh
vagrant up
./create-certs.sh
./init-swarm.sh


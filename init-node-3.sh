#!/usr/bin/env sh

vagrant up node-3
vagrant halt node-3
vagrant up node-3
token=$(vagrant ssh manager-1 -- "docker swarm join-token -q worker")
vagrant ssh node-3 -- "docker swarm join --token $token 192.168.250.31"

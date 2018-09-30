#!/usr/bin/env sh

vagrant up node-4
token=$(vagrant ssh manager-1 -- "docker swarm join-token -q worker")
vagrant ssh node-4 -- "docker swarm join --token $token 192.168.250.31"

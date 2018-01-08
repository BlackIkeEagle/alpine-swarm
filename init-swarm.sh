#!/usr/bin/env sh

vagrant ssh manager-1 -- "docker swarm init --advertise-addr=192.168.250.31"
token=$(vagrant ssh manager-1 -- "docker swarm join-token -q manager")
vagrant ssh manager-2 -- "docker swarm join --token $token 192.168.250.31"
token=$(vagrant ssh manager-1 -- "docker swarm join-token -q worker")
vagrant ssh node-1 -- "docker swarm join --token $token 192.168.250.31"
vagrant ssh node-2 -- "docker swarm join --token $token 192.168.250.31"

#!/usr/bin/env sh

vagrant ssh node-1 -- "sudo docker swarm init --advertise-addr=192.168.254.31"
token=$(vagrant ssh node-1 -- "sudo docker swarm join-token -q worker")
vagrant ssh node-2 -- "sudo docker swarm join --token $token 192.168.254.31"
vagrant ssh node-3 -- "sudo docker swarm join --token $token 192.168.254.31"

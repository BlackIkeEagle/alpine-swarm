#!/usr/bin/env sh

vagrant ssh node-4 -- "docker swarm leave"
vagrant ssh manager-1 -- "docker node rm node-4"
vagrant halt node-4

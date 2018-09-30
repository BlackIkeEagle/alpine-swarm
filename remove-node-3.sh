#!/usr/bin/env sh

vagrant ssh node-3 -- "docker swarm leave"
vagrant ssh manager-1 -- "docker node rm node-3"
vagrant halt node-3

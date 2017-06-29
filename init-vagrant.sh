#!/usr/bin/env sh

vagrant plugin install vagrant-alpine
vagrant plugin install vagrant-scp

vagrant up
vagrant halt

#!/usr/bin/env sh

vagrant ssh storage-1 -- 'sudo mkdir -p /srv/storage/pimcore'
vagrant ssh storage-1 -- 'cd /srv/storage/pimcore/; sudo wget -c https://github.com/BlackIkeEagle/swarm-sample-pimcore/releases/download/0.0.0/var.tar.gz'
vagrant ssh storage-1 -- 'cd /srv/storage/pimcore/; sudo wget -c https://github.com/BlackIkeEagle/swarm-sample-pimcore/releases/download/0.0.0/demo-twig.sql'
vagrant ssh storage-1 -- 'cd /srv/storage/pimcore/; sudo tar -zxf var.tar.gz; sudo rm var.tar.gz'
vagrant ssh storage-1 -- 'cd /srv/storage/pimcore/; sudo chown -R 33:33 var web-var'


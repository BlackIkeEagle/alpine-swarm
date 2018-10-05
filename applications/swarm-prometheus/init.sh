#!/usr/bin/env sh

vagrant ssh storage-1 -- 'sudo mkdir -p /srv/storage/mon/prometheus'
vagrant ssh storage-1 -- 'sudo mkdir -p /srv/storage/mon/grafana'
vagrant ssh storage-1 -- 'sudo mkdir -p /srv/storage/mon/alertmanager'


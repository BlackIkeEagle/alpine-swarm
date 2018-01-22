#!/usr/bin/env sh

vagrant plugin install vagrant-alpine
vagrant plugin install vagrant-scp

./vagrant up
vagrant scp ./rsyslog.conf storage-1:rsyslog.conf
vagrant ssh storage-1 -- 'sudo mv /home/vagrant/rsyslog.conf /etc/rsyslog.conf; sudo chown root:root /etc/rsyslog.conf'
./vagrant halt

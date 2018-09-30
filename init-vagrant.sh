#!/usr/bin/env sh

#vagrant plugin install vagrant-alpine

vagrant up
vagrant ssh-config > tmpsshconfig 2>/dev/null
scp -F tmpsshconfig ./rsyslog.conf storage-1:rsyslog.conf
rm tmpsshconfig
vagrant ssh storage-1 -- 'sudo mv /home/vagrant/rsyslog.conf /etc/rsyslog.conf; sudo chown root:root /etc/rsyslog.conf'
vagrant halt

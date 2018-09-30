#!/usr/bin/env sh

vagrant ssh storage-1 -- 'sudo mkdir -p /srv/storage/magento2/var'
vagrant ssh storage-1 -- 'sudo mkdir -p /srv/storage/magento2/redis'
vagrant ssh storage-1 -- 'cd /srv/storage/magento2/; sudo wget -c https://github.com/BlackIkeEagle/swarm-sample-magento2/releases/download/0.0.0/media.tar.gz'
vagrant ssh storage-1 -- 'cd /srv/storage/magento2/; sudo wget -c https://github.com/BlackIkeEagle/swarm-sample-magento2/releases/download/0.0.0/magento2-demo.sql'
vagrant ssh storage-1 -- 'cd /srv/storage/magento2/; sudo tar -zxf media.tar.gz; sudo rm media.tar.gz'
vagrant ssh-config > tmpsshconfig 2>/dev/null
scp -F tmpsshconfig env.php storage-1:env.php
rm tmpsshconfig
vagrant ssh storage-1 -- 'cd /srv/storage/magento2/; sudo mv /home/vagrant/env.php ./'
vagrant ssh storage-1 -- 'cd /srv/storage/magento2/; sudo chown -R 33:33 var media env.php; sudo chown -R 100:101 redis'

vagrant ssh manager-2 -- 'sudo mkdir /var/lib/magento2-mysql; sudo chown 999:999 /var/lib/magento2-mysql'


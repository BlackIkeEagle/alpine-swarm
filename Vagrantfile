# -*- mode: ruby -*-
# vi: set ft=ruby ts=2 sw=2 sts=2 :

# if edge is needed:
#cat /etc/apk/repositories | sed -e 's/\\/v.*\\//\\/edge\\//g' > /etc/apk/repositories-new
#mv /etc/apk/repositories-new /etc/apk/repositories

$alpinescript = <<SCRIPT
echo I am provisioning...
tail -n1 /etc/apk/repositories | sed -e 's/main/community/' >> /etc/apk/repositories
apk --update --no-cache upgrade
apk add --update --no-cache docker
sed 's/^\\(docker.*\\)/\\1vagrant/' -i /etc/group
rc-update add docker default
rc-service docker start
SCRIPT

$alpinestorage = <<SCRIPT
echo I am provisioning...
apk --update --no-cache upgrade
apk add --update --no-cache nfs-utils
rc-update add nfs default
mkdir -p /srv/storage
echo '/srv/storage 192.168.250.0/24(rw,async,no_subtree_check)' >> /etc/exports
rc-service nfs start
SCRIPT

Vagrant.configure("2") do |config|

  (1..2).each do |i|
    config.vm.define "manager-#{i}" do |manager|
      manager.vm.box = "maier/alpine-3.7-x86_64"
      manager.vm.synced_folder '.', '/vagrant', disabled: true
      manager.vm.hostname = "manager-#{i}"
      manager.vm.network :private_network, ip: "192.168.250.3#{i}"
      manager.vm.provision "shell", inline: $alpinescript
    end
  end

  (1..2).each do |j|
    config.vm.define "node-#{j}" do |node|
      node.vm.box = "maier/alpine-3.7-x86_64"
      node.vm.synced_folder '.', '/vagrant', disabled: true
      node.vm.hostname = "node-#{j}"
      node.vm.network :private_network, ip: "192.168.250.4#{j}"
      node.vm.provision "shell", inline: $alpinescript
    end
  end

  (1..1).each do |k|
    config.vm.define "storage-#{k}" do |storage|
      storage.vm.box = "maier/alpine-3.7-x86_64"
      storage.vm.synced_folder '.', '/vagrant', disabled: true
      storage.vm.hostname = "storage-#{k}"
      storage.vm.network :private_network, ip: "192.168.254.2#{k}"
      storage.vm.provision "shell", inline: $alpinestorage
    end
  end

end

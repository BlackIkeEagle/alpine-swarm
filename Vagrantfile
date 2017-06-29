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
rc-update add docker default
SCRIPT

Vagrant.configure("2") do |config|

  (1..3).each do |i|
    config.vm.define "node-#{i}" do |node|
      node.vm.box = "maier/alpine-3.6-x86_64"
      node.vm.synced_folder '.', '/vagrant', disabled: true
      node.vm.network :private_network, ip: "192.168.254.3#{i}"
      node.vm.provision "shell", inline: $alpinescript
    end
  end

  # future sharing stuff
  #(1..2).each do |j|
    #config.vm.define "storage-#{j}" do |storage|
      #storage.vm.box = "bento/freebsd-11.0"
      ##storage.vm.box = "freebsd/FreeBSD-11.0-STABLE"
      ##storage.vm.guest = :freebsd
      #storage.ssh.shell = "sh"
      ##storage.vm.base_mac = "080027D14C66"
      #storage.vm.synced_folder '.', '/vagrant', disabled: true
      #storage.vm.network :private_network, ip: "192.168.254.4#{j}"
    #end
  #end

end

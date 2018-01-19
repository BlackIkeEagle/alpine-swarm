#!/usr/bin/env sh

[ -d server-client ] && rm -r server-client
[ -d server-cert ] && rm -r server-cert

mkdir -p client-cert
docker run --user=$(id -u) --rm -v $(pwd)/client-cert:/certs paulczar/omgwtfssl

mkdir -p server-cert
cp client-cert/ca.pem server-cert/

docker run --user=$(id -u) --rm -v $(pwd)/server-cert:/server \
    -v $(pwd)/client-cert:/certs \
    -e SSL_IP=127.0.0.1,192.168.250.31,192.168.250.32 \
    -e SSL_DNS=docker.local -e SSL_KEY=/server/key.pem \
    -e SSL_CERT=/server/cert.pem paulczar/omgwtfssl

docker_server_args="-H unix:///var/run/docker.sock -H tcp://0.0.0.0:2375 --tlsverify --tlscacert=/etc/docker/ssl/ca.pem --tlscert=/etc/docker/ssl/cert.pem --tlskey=/etc/docker/ssl/key.pem"

# manager 1
vagrant ssh manager-1 -- "sudo sed -e 's#^\\(command_args.*\\)\\(\"\\)#\\1 $docker_server_args\\2#g' -i /etc/init.d/docker"
vagrant ssh manager-1 -- "mkdir -p /home/vagrant/ssl"
vagrant scp server-cert/ca.pem manager-1:/home/vagrant/ssl/ca.pem
vagrant scp server-cert/cert.pem manager-1:/home/vagrant/ssl/cert.pem
vagrant scp server-cert/key.pem manager-1:/home/vagrant/ssl/key.pem
vagrant ssh manager-1 -- "sudo mv ssl /etc/docker/; sudo chown root:root -R /etc/docker/ssl"
vagrant ssh manager-1 -- "sudo rc-service docker restart"

# manager 2
vagrant ssh manager-2 -- "sudo sed -e 's#^\\(command_args.*\\)\\(\"\\)#\\1 $docker_server_args\\2#g' -i /etc/init.d/docker"
vagrant ssh manager-2 -- "mkdir -p /home/vagrant/ssl"
vagrant scp server-cert/ca.pem manager-2:/home/vagrant/ssl/ca.pem
vagrant scp server-cert/cert.pem manager-2:/home/vagrant/ssl/cert.pem
vagrant scp server-cert/key.pem manager-2:/home/vagrant/ssl/key.pem
vagrant ssh manager-2 -- "sudo mv ssl /etc/docker/; sudo chown root:root -R /etc/docker/ssl"
vagrant ssh manager-2 -- "sudo rc-service docker restart"


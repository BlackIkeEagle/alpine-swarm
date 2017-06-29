#!/usr/bin/env sh

mkdir -p client-cert
docker run --user=$(id -u) --rm -v $(pwd)/client-cert:/certs paulczar/omgwtfssl

mkdir -p server-cert
cp client-cert/ca.pem server-cert/

docker run --rm -v $(pwd)/server-cert:/server \
    -v $(pwd)/client-cert:/certs \
    -e SSL_IP=127.0.0.1,192.168.254.31 \
    -e SSL_DNS=docker.local -e SSL_KEY=/server/key.pem \
    -e SSL_CERT=/server/cert.pem paulczar/omgwtfssl

docker_server_args="-H unix:///var/run/docker.sock -H tcp://0.0.0.0:2375 --tlsverify --tlscacert=/etc/docker/ssl/ca.pem --tlscert=/etc/docker/ssl/cert.pem --tlskey=/etc/docker/ssl/key.pem"

vagrant ssh node-1 -- "sudo sed -e 's#^\\(command_args.*\\)\\(\"\\)#\\1 $docker_server_args\\2#g' -i /etc/init.d/docker"
vagrant ssh node-1 -- "mkdir -p /home/vagrant/ssl"

vagrant scp server-cert/ca.pem node-1:/home/vagrant/ssl/ca.pem
vagrant scp server-cert/cert.pem node-1:/home/vagrant/ssl/cert.pem
vagrant scp server-cert/key.pem node-1:/home/vagrant/ssl/key.pem

vagrant ssh node-1 -- "sudo mv ssl /etc/docker/; sudo chown root:root -R /etc/docker/ssl"

vagrant ssh node-1 -- "sudo rc-service docker restart"

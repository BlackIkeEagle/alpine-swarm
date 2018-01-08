Up and running example test
===========================

``` sh
$ ./init-vagrant.sh
$ vagrant up
$ ./create-certs.sh
$ ./init-swarm.sh
$ eval $(./docker.sh)
$ cd example
$ docker ps
$ docker service ls
$ docker node ls
$ docker stack deploy --compose-file=docker-compose.yml test
$ docker service scale test_nginx=3
$ docker service logs -f test_nginx
```

Test if the nginx is working fine by browsing to http://192.168.250.31

see the logs

to see the load banacing in action you can quickly run a siege

``` sh
$ siege -c 50 -r 50 http://192.168.250.31/
```

some example output of the logs when running siege against it

```
test_nginx.3.si7742i0okhq@alpine36    | 10.255.0.2 - - [29/Jun/2017:14:37:23 +0000] "GET / HTTP/1.1" 200 612 "-" "Mozilla/5.0 (unknown-x86_64-linux-gnu) Siege/4.0.2" "-"
test_nginx.5.tdws6yzhj685@alpine36    | 10.255.0.2 - - [29/Jun/2017:14:37:23 +0000] "GET / HTTP/1.1" 200 612 "-" "Mozilla/5.0 (unknown-x86_64-linux-gnu) Siege/4.0.2" "-"
test_nginx.1.z88abjf5r90o@alpine36    | 10.255.0.2 - - [29/Jun/2017:14:37:23 +0000] "GET / HTTP/1.1" 200 612 "-" "Mozilla/5.0 (unknown-x86_64-linux-gnu) Siege/4.0.2" "-"
test_nginx.3.si7742i0okhq@alpine36    | 10.255.0.2 - - [29/Jun/2017:14:37:23 +0000] "GET / HTTP/1.1" 200 612 "-" "Mozilla/5.0 (unknown-x86_64-linux-gnu) Siege/4.0.2" "-"
test_nginx.5.tdws6yzhj685@alpine36    | 10.255.0.2 - - [29/Jun/2017:14:37:23 +0000] "GET / HTTP/1.1" 200 612 "-" "Mozilla/5.0 (unknown-x86_64-linux-gnu) Siege/4.0.2" "-"
test_nginx.1.z88abjf5r90o@alpine36    | 10.255.0.2 - - [29/Jun/2017:14:37:24 +0000] "GET / HTTP/1.1" 200 612 "-" "Mozilla/5.0 (unknown-x86_64-linux-gnu) Siege/4.0.2" "-"
test_nginx.3.si7742i0okhq@alpine36    | 10.255.0.2 - - [29/Jun/2017:14:37:24 +0000] "GET / HTTP/1.1" 200 612 "-" "Mozilla/5.0 (unknown-x86_64-linux-gnu) Siege/4.0.2" "-"
```

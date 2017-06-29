3 node alpine vagrant
=====================

First
-----

Since we are using alpine linux we must install the alpine plugin for vagrant.

To make this easy for you you can run

``` sh
$ ./init-vagrant.sh
```

Run
---

``` sh
$ vagrant up
```

ssh into one of the nodes

``` sh
$ vagrant ssh node-1
$ vagrant ssh node-2
$ vagrant ssh node-3
```

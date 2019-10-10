# Consul lab

The simplest way to get a fully working Consul Cluster on 3 VMs :)

## Requirements

- virtualbox
- vagrant

This project uses Ansible but __you don't need it on your host__ : it's installed on a VM by Vagrant and provisions everything from there.

## Run

```
vagrant up
```

That's it ! Have a cup of coffee while looking at Vagrant upping the VMs and setting everything for you.


## Check

When it's finished, ssh in any VM* and check your Consul cluster :

```
vagrant ssh worker-0
consul members
```

you should get something like that :

```
Node      Address           Status  Type    Build  Protocol  DC   Segment
master    172.16.0.10:8301  alive   server  1.6.1  2         dc1  <all>
worker-0  172.16.1.10:8301  alive   client  1.6.1  2         dc1  <default>
worker-1  172.16.1.11:8301  alive   client  1.6.1  2         dc1  <default>
```

\* except "provisionner" which is used to run Ansible scripts and is not part of the cluster


## Article

I made this project to illustrate my article ["Zero-trust network with Consul Connect & Docker"](https://matthieujacquot.com/post/zero-trust-network-with-consul-connect-and-docker/)

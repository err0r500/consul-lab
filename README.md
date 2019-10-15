# Consul Connect with Docker

The purpose of this repo is to show how one can use Consul Connect service-mesh capabilites with its built-in proxy in order to :
- encapsulate Docker containers networks (avoid east-west traffic between containers on the same host)
- enforce mTLS service-to-service communication 

This project illustrates this article ["Zero-trust network with Consul Connect & Docker"](https://matthieujacquot.com/post/zero-trust-network-with-consul-connect-and-docker/)

Since the built-in proxy is "Layer 4" (aka "L4", aka up to transport layer) we can't route traffic based on the request url but instead use a specific port to reach another service. (see Check below)

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

### Consul cluster is up & running

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

### Communication betweeen containers

```
vagrant ssh worker-1
sudo docker exec caller curl localhost:12345
```

You should get a response from the `echo` container running on `worker-0` host 

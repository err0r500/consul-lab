# Consul lab

The simplest way to get a fully working Consul Cluster on 3 VMs :)

## Requirements

- virtualbox
- vagrant

## Run

```
vagrant up
```

Then have a coffee while looking at vagrant upping the VMs and setting everything for you.

---

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


\* except "provisionner" which is used to run ansible scripts and is not part of the cluster

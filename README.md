Istio capabilities :
load balancing 
- HTTP
- gRPC
- websocket
- TCP

routing:

retries:

failover:

fault-injection:

ACL:

rate-limits

quotas:

service-to-service : mTLS

Fine-grained control of traffic behavior with rich routing rules, retries, failovers, and fault injection.

A pluggable policy layer and configuration API supporting access controls, rate limits and quotas.

Automatic metrics, logs, and traces for all traffic within a cluster, including cluster ingress and egress.

Secure service-to-service communication in a cluster with strong identity-based authentication and authorization.









====
## from client-0
sudo docker run --rm -d -p 127.0.0.1:5678:5678 --name echo hashicorp/http-echo -text="hi from echo server"
sudo docker run --network=container:echo consul connect proxy --sidecar-for echo --http-addr 172.17.0.1:8500

## from client-1
sudo docker run --name caller -p 172.17.0.1:9000:9000  amouat/network-utils python -m SimpleHTTPServer 9000
sudo docker exec -it caller sh
sudo docker run --network=container:caller consul connect proxy --sidecar-for caller --http-addr 172.17.0.1:8500    // --service-addr 172.17.0.1

#!/bin/bash

#service configuration
SERVICE_FILE="/etc/systemd/system/consul.service"
CURR_USER=$(id -u):$(id -g)

sudo touch $SERVICE_FILE
sudo chown $CURR_USER $SERVICE_FILE
cat > /etc/systemd/system/consul.service <<'EOF'
[Unit]
Description="HashiCorp Consul - A service mesh solution"
Documentation=https://www.consul.io/
Requires=network-online.target
After=network-online.target
ConditionFileNotEmpty=/etc/consul.d/consul.hcl

[Service]
User=vagrant
Group=vagrant
ExecStart=/usr/local/bin/consul agent -config-dir=/etc/consul.d/
ExecReload=/usr/local/bin/consul reload
KillMode=process
Restart=on-failure
LimitNOFILE=65536

[Install]
WantedBy=multi-user.target
EOF


# configure the server agent
sudo mkdir -p /etc/consul.d
sudo touch /etc/consul.d/consul.hcl
sudo chown -R vagrant:vagrant /etc/consul.d
sudo chmod 640 /etc/consul.d/consul.hcl

KEY=$(consul keygen)
cat > /etc/consul.d/consul.hcl <<CONS
server = true
bootstrap_expect = 1
datacenter = "dc1"
data_dir = "/tmp"
encrypt = "$KEY"
advertise_addr = "172.16.0.10"
connect {enabled = true}
CONS

#retry_join = ["172.16.0.10"]
#addresses {
#    http  = "127.0.0.1 172.17.0.1"
#}

sudo systemctl enable consul
sudo systemctl start consul

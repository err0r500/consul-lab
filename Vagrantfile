# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
    vb.customize ["modifyvm", :id, "--audio", "none"]
  end

  config.vm.define "master" do |c|
      c.vm.hostname = "master"
      c.vm.network "private_network", ip: "172.16.0.10"

      c.vm.provider "virtualbox" do |vb|
        vb.memory = "2048"
      end
  end

  (0..1).each do |n|
    config.vm.define "worker-#{n}" do |c|
        c.vm.hostname = "worker-#{n}"
        c.vm.network "private_network", ip: "172.16.1.1#{n}"

    end
  end

  config.vm.define 'controller' do |machine|
    machine.vm.network "private_network", ip: "172.16.2.10"

    machine.vm.provision :ansible_local do |ansible|
      ansible.playbook       = "/vagrant/ansible/main.yml"
      # ansible.verbose        = true
      ansible.install        = true
      ansible.limit          = "all" 
      ansible.inventory_path = "/vagrant/ansible/inventory"
    end
  end

end

# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.provision :shell, path: "bootstrap.sh"
  config.vm.network :forwarded_port, guest: 80, host: 5511
  config.vm.network :forwarded_port, guest: 5544, host: 5544
  #config.vm.network "public_network", bridge: "..."
  config.vm.network :private_network, ip: "192.168.68.11"
  config.vm.provider "virtualbox" do |v|
	  v.memory = 1024
	end
	
  config.ssh.username = 'vagrant'
  config.ssh.password = 'vagrant'

  config.ssh.insert_key = false
  config.ssh.paranoid = false
  config.ssh.keys_only = false
  config.ssh.username = "vagrant" # change as appropriate
  config.ssh.password = "vagrant"
  
  config.vm.boot_timeout = 600
end

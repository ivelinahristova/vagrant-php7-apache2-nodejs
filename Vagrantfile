# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "ubuntu/trusty32"
  config.vm.provision :shell, path: "bootstrap.sh"
  config.vm.network :forwarded_port, guest: 80, host: 5588
  config.vm.network :forwarded_port, guest: 5533, host: 5533
  config.vm.network "public_network"
  config.vm.provider "virtualbox" do |v|
	  v.memory = 1024
	end
	
config.ssh.username = 'vagrant'
config.ssh.password = 'vagrant'
#config.ssh.insert_key = 'true'


  config.ssh.insert_key = false
  config.ssh.paranoid = false
  config.ssh.keys_only = false
  config.ssh.username = "vagrant" # change as appropriate
  config.ssh.password = "vagrant"
  
  config.vm.boot_timeout = 600
end

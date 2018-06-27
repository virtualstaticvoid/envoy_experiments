# -*- mode: ruby -*-
# vi: set ft=ruby :

# ensure vagrant-disksize plugin ~ this has been deprecated :-(
# Vagrant.require_plugin "vagrant-disksize"

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|

  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "ubuntu/xenial64" # 16.04 LTS

  # increase the disk size to 25GB (from 10GB)
  config.disksize.size = '25GB'

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # gateway

  config.vm.network "forwarded_port", guest: 8000, host: 8000 # gateway
  config.vm.network "forwarded_port", guest: 8001, host: 8001 # gateway envoy admin

  # base services

  config.vm.network "forwarded_port", guest: 8010, host: 8010 # redis
  config.vm.network "forwarded_port", guest: 8011, host: 8011 # redis envoy admin
  config.vm.network "forwarded_port", guest: 8012, host: 8012 # redis direct

  config.vm.network "forwarded_port", guest: 8020, host: 8020 # postgres
  config.vm.network "forwarded_port", guest: 8021, host: 8021 # postgres envoy admin
  config.vm.network "forwarded_port", guest: 8022, host: 8022 # postgres direct

  config.vm.network "forwarded_port", guest: 8030, host: 8030 # rabbitmq
  config.vm.network "forwarded_port", guest: 8031, host: 8031 # rabbitmq envoy admin
  config.vm.network "forwarded_port", guest: 8032, host: 8032 # rabbitmq direct
  config.vm.network "forwarded_port", guest: 8033, host: 8033 # rabbitmq admin


  # application services

  config.vm.network "forwarded_port", guest: 8050, host: 8050 # http service
  config.vm.network "forwarded_port", guest: 8051, host: 8051 # http envoy admin
  config.vm.network "forwarded_port", guest: 8052, host: 8052 # http service direct

  config.vm.network "forwarded_port", guest: 8060, host: 8060 # redis service
  config.vm.network "forwarded_port", guest: 8061, host: 8061 # redis envoy admin
  config.vm.network "forwarded_port", guest: 8062, host: 8062 # redis service direct

  config.vm.network "forwarded_port", guest: 8070, host: 8070 # postgres service
  config.vm.network "forwarded_port", guest: 8071, host: 8071 # postgres envoy admin
  config.vm.network "forwarded_port", guest: 8072, host: 8072 # postgres service direct

  config.vm.network "forwarded_port", guest: 8080, host: 8080 # rabbitmq service
  config.vm.network "forwarded_port", guest: 8081, host: 8081 # rabbitmq envoy admin
  config.vm.network "forwarded_port", guest: 8082, host: 8082 # rabbitmq service direct

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end

  config.vm.provider "virtualbox" do |vb|
    vb.cpus = "2"
    vb.memory = "2048"
  end

  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell", privileged: true, inline: <<-SHELL

    ##
    # pre-requisites
    apt-get update
    apt-get install -y curl software-properties-common apt-transport-https byobu

    ##
    # setup software source for apt
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
    apt-key fingerprint 0EBFCD88
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

    # install docker community edition
    apt-get update
    apt-get install -y docker-ce

    # make it so sudo isn't required to run docker
    usermod -aG docker vagrant

    # install docker-compose
    curl -fsSL "https://github.com/docker/compose/releases/download/1.17.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose

    # verify docker works
    docker run hello-world

    # tools
    apt-get install -y redis-tools postgresql-client

  SHELL

  config.vm.provision "shell", privileged: false, inline: <<-SHELL

    # copy over .bashrc
    cp /vagrant/files/.bashrc $HOME/.bashrc
    cp /vagrant/files/.inputrc $HOME/.inputrc

    # the environment
    cp --no-clobber /vagrant/.env.example /vagrant/.env

  SHELL

  config.vm.provision "shell", privileged: true, inline: <<-SHELL

    cd /vagrant

    # pull all images
    docker-compose pull

    # build images
    docker-compose build

  SHELL

end

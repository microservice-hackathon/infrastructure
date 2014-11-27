# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "debian-wheezy-amd64-4118"
  config.vm.box_url = "http://www.mimuw.edu.pl/~luk/vagrant/debian-wheezy-amd64-4118.box"

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "site.yml"
    ansible.extra_vars = {
      'use_vagrant' => 1,
    }
    ansible.groups = {
      "loggers"  => ["loggers"],
      "apps"     => ["apps"],
      "graphite" => ["graphite"],
      "nexus"    => ["nexus"],
    }
  end

  config.vm.define 'loggers' do |config|
    config.vm.host_name = 'loggers'
    config.vm.network "private_network", type: "dhcp"
  end

  config.vm.define 'apps' do |config|
    config.vm.host_name = 'apps'
    config.vm.network "private_network", type: "dhcp"
  end

  config.vm.define 'graphite' do |config|
    config.vm.host_name = 'graphite'
    config.vm.network "private_network", type: "dhcp"
  end

  config.vm.define 'nexus' do |config|
    config.vm.host_name = 'nexus'
    config.vm.network "private_network", type: "dhcp"
  end

end

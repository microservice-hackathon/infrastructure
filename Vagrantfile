# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "puppetlabs/debian-7.8-32-nocm"

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
    config.vm.network "private_network", ip: "10.11.12.10"
  end

  config.vm.define 'apps' do |config|
    config.vm.host_name = 'apps'
    config.vm.network "private_network", ip: "10.11.12.11"
  end

  config.vm.define 'graphite' do |config|
    config.vm.host_name = 'graphite'
    config.vm.network "private_network", ip: "10.11.12.12"
  end

  config.vm.define 'nexus' do |config|
    config.vm.host_name = 'nexus'
    config.vm.network "private_network", ip: "10.11.12.13"
  end

  config.vm.define 'jenkins' do |config|
    config.vm.host_name = 'jenkins'
    config.vm.network "private_network", ip: "10.11.12.14"
  end

  config.vm.define 'rundeck' do |config|
    config.vm.host_name = 'rundeck'
    config.vm.network "private_network", ip: "10.11.12.15"
  end

end

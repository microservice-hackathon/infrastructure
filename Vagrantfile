# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "debian-wheezy-amd64"

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
  end

  config.vm.define 'apps' do |config|
    config.vm.host_name = 'apps'
  end

  config.vm.define 'graphite' do |config|
    config.vm.host_name = 'graphite'
  end

  config.vm.define 'nexus' do |config|
    config.vm.host_name = 'nexus'
  end

end

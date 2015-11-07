# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

# TODO: create hackathon edition for vagrant and read this var from there
DOMAIN = "uservices.local"

Vagrant.require_version ">= 1.7.2"

plugins = [
  'vagrant-hostmanager',
]

plugins.each do |plugin|
  if !Vagrant.has_plugin?(plugin)
    puts "Please execute: vagrant plugin install #{plugin}"
    exit 1
  end
end

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.hostmanager.enabled = true
  config.hostmanager.manage_host = false
  config.hostmanager.ignore_private_ip = false
  config.hostmanager.include_offline = true

  config.vm.box = "debian/jessie64"

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "site.yml"
  end

  config.vm.define "monitoring" do |config|
    config.vm.host_name = "monitoring.#{DOMAIN}"
    config.vm.network "private_network", ip: "10.11.12.10"
  end

  config.vm.define "apps" do |config|
    config.vm.host_name = "apps.#{DOMAIN}"
    config.vm.network "private_network", ip: "10.11.12.11"
  end

  config.vm.define "nexus" do |config|
    config.vm.host_name = "nexus.#{DOMAIN}"
    config.vm.network "private_network", ip: "10.11.12.13"
  end

  config.vm.define "jenkins" do |config|
    config.vm.host_name = "jenkins.#{DOMAIN}"
    config.vm.network "private_network", ip: "10.11.12.14"
  end

  config.vm.define "rundeck" do |config|
    config.vm.host_name = "rundeck.#{DOMAIN}"
    config.vm.network "private_network", ip: "10.11.12.15"
  end

end

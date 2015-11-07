# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'

Vagrant.require_version ">= 1.7.2"

default_settings = YAML.load_file 'hackathons/default.yml'
domain = default_settings['domain']

plugins = [
  'vagrant-hostmanager',
]

plugins.each do |plugin|
  if !Vagrant.has_plugin?(plugin)
    puts "Please execute: vagrant plugin install #{plugin}"
    exit 1
  end
end

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.hostmanager.enabled = true
  config.hostmanager.manage_host = false
  config.hostmanager.ignore_private_ip = false
  config.hostmanager.include_offline = true

  config.vm.box = "debian/jessie64"

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "site.yml"
    ansible.extra_vars = {
      'is_vagrant' => 1,
    }
  end

  config.vm.define "monitoring" do |config|
    config.vm.host_name = "monitoring.#{domain}"
    config.vm.network "private_network", ip: "10.11.12.10"
    config.hostmanager.aliases = [
      "graphite.#{domain}",
      "grafana.#{domain}",
      "kibana.#{domain}",
      "elasticsearch.#{domain}",
    ]
  end

  config.vm.define "apps" do |config|
    config.vm.host_name = "apps.#{domain}"
    config.vm.network "private_network", ip: "10.11.12.11"
  end

  config.vm.define "nexus" do |config|
    config.vm.host_name = "nexus.#{domain}"
    config.vm.network "private_network", ip: "10.11.12.13"
  end

  config.vm.define "jenkins" do |config|
    config.vm.host_name = "jenkins.#{domain}"
    config.vm.network "private_network", ip: "10.11.12.14"
  end

  config.vm.define "rundeck" do |config|
    config.vm.host_name = "rundeck.#{domain}"
    config.vm.network "private_network", ip: "10.11.12.15"
  end

end

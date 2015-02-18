# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = '2'

Vagrant.require_version '>= 1.5.0'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.hostname = 'stackstorm'
  config.vm.box = 'chef/ubuntu-14.04'
  config.berkshelf.enabled = true

  if Vagrant.has_plugin?("vagrant-omnibus")
    config.omnibus.chef_version = 'latest'
  end

  config.vm.provision :chef_solo do |chef|
    chef.run_list = [
      'recipe[stackstorm::rabbitmq]',
      'recipe[stackstorm::default]'
    ]
  end
end

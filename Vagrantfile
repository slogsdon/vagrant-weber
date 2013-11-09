# vim: set syntax=ruby

# Set your project name here
weber_project_name = "weber_test"

Vagrant.configure("2") do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.network :forwarded_port, guest: 8080, host: 8080

  # installer/updater for erlang
  config.vm.provision :shell do |sh|
    sh.privileged = false
    sh.path = "provision/shell/install_erlang.sh"
  end

  # install some necessary tools for building elixir and weber
  config.vm.provision :shell, :inline => "sudo apt-get install -y git build-essential"

  # installer/updater for elixir
  config.vm.provision :shell do |sh|
    sh.privileged = false
    sh.path = "provision/shell/install_elixir.sh"
  end

  # installer/updater for weber
  config.vm.provision :shell do |sh|
    sh.privileged = false
    sh.inline = "export PROJECT_NAME=\"#{weber_project_name}\" && cd $HOME && /bin/bash /vagrant/provision/shell/install_weber.sh"
  end

  # write our start script
  config.vm.provision :shell do |sh|
    sh.privileged = false
    sh.inline = "cat > /vagrant/start_in_vagrant.sh <<< \"#!/usr/bin/env sh\nvagrant ssh -c \'cd /vagrant/#{weber_project_name} && /bin/sh start.sh\'\""
  end
end

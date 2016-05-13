# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.ssh.forward_agent = true
  config.vm.network "forwarded_port", guest: 2375, host: 2375

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 2048
    vb.cpus = 2
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end

  # config.vm.provision "shell", path: "ansible/install_ansible.sh"
  config.vm.provision :shell, inline: <<-EOF
    GALAXY=/usr/local/bin/ansible-galaxy
    echo '#!/usr/bin/env bash
    /usr/bin/ansible-galaxy "$@"
    exit 0
    ' | sudo tee $GALAXY
    sudo chmod 0755 $GALAXY
  EOF

  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "ansible/playbooks/vagrant.yml"
  end

end


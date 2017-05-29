# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  config.vm.box = "debian/jessie64"

  config.vm.define "node1" do |node1|
    node1.vm.provision "ansible_local" do |ansible|
      ansible.install_mode = "pip"
      ansible.sudo = true
      ansible.playbook = "vagrant/node1.yml"
    end
  end

  config.vm.define "node2" do |node1|
    node1.vm.provision "ansible_local" do |ansible|
      ansible.install_mode = "pip"
      ansible.sudo = true
      ansible.playbook = "vagrant/node2.yml"
    end
  end
end

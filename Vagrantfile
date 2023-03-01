# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|

  # Managed webserver.
  config.vm.define "webserver" do |webserver|
    webserver.vm.box = "ubuntu/xenial64"
    #webserv.vm.hostname = "webserver.dev.com"
    webserver.vm.network "private_network", ip: "192.168.33.10"
	webserver.vm.provision "file", source: "evt.html", destination: "/home/vagrant/evt.html"
    #webserver.vm.provision "shell", path: "lamp_server_script.sh"
	webserver.vm.provision "file", source: "lamp_server_script.sh", destination: "/home/vagrant/lamp_server_script.sh"
	#webserver.vm.provision "file", source: "evt.html", destination: "/home/vagrant/evt.html"
  end

end

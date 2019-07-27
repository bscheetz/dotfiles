# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "bento/ubuntu-18.04"

  config.ssh.forward_agent = true
  config.ssh.insert_key = false

  # for GUI
  # config.ssh.forward_x11 = true
  
  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  config.vm.box_check_update = true

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 22, host: 2222, host_ip: "0.0.0.0", auto_correct: true

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
   vb.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/vagrant", "1"]
   vb.cpus = 8
   vb.memory = 28000
	
   vb.gui = false
    # Customize the amount of memory on the VM:
	# vb.customize ["modifyvm", :id, "--graphicscontroller", "vboxvga"]
	# vb.customize ["modifyvm", :id, "--ioapic", "on"]
	# vb.customize ["modifyvm", :id, "--accelerate3d", "on"]
	# vb.customize ["modifyvm", :id, "--vram", "256"]
	# vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
	# vb.customize ["modifyvm", :id, "--draganddrop", "bidirectional"]
	
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  
  config.vm.synced_folder "#{Dir.home}/Documents", "/home/vagrant/documents", mount_options:["dmode=775,fmode=744"], type: "nfs"
  config.vm.synced_folder "#{Dir.home}/.ssh", "/home/vagrant/.ssh", mount_options:["dmode=775,fmode=600"], type: "nfs"

  ssh_pub_key = File.readlines("#{Dir.home}/.ssh/id_rsa.pub").first.strip
  config.vm.provision 'shell', inline: 'mkdir -p /root/.ssh'
  config.vm.provision 'shell', inline: "echo #{ssh_pub_key} >> /root/.ssh/authorized_keys"
  config.vm.provision 'shell', inline: "echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys", privileged: false

  config.ssh.private_key_path = ["#{Dir.home}/.ssh/id_rsa", "~/.vagrant.d/insecure_private_key"]
  
  config.vm.provision "shell", inline: <<-SHELL
    	
	# ensure that any code that is pulled from git has linux line endings, not windows
	git config --global core.autocrlf input
	
	sudo apt-get update
	sudo apt-get install gcc g++ ntp
	
	# for xgboost
	yes 'Y' | sudo apt-get install gcc-5 g++-5
	echo 'export CC="gcc-5"' >> $HOME/.bashrc
	echo 'export CXX="g++-5"' >> $HOME/.bashrc
	
	# set up SSH if it's not already set up
	[[ -d /home/vagrant/.ssh ]] || mkdir /home/vagrant/.ssh
	[[ -f /home/vagrant/.ssh/id_rsa ]] || ssh-keygen -f /home/vagrant/.ssh/id_rsa -t rsa -N ''

	# install docker
	yes 'y' | sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	sudo add-apt-repository	\
	  "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

	sudo apt-get update
	yes 'y' | sudo apt-get install docker-ce

	# add vagrant user to the docker group
	sudo usermod -aG docker vagrant

	# install pyenv
	curl https://pyenv.run | bash
	
	# installation to allow a GUI for the VM
    	# sudo apt-get install -y virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11
	# sudo apt-get install -y ubuntu-gnome-desktop
	# sudo sed -i 's/allowed_users=.*$/allowed_users=anybody/' /etc/X11/Xwrapper.config
	# sudo apt-get install -y xterm
	# sudo apt-get install -y dkms build-essential linux-headers-generic linux-headers-$(uname -r)
	# sudo apt-get install -y virtualbox-guest-additions-iso
	# sudo apt-get install lightdm
	# sudo echo "/usr/sbin/lightdm" > /etc/X11/default-display-manager
	# sudo mount /usr/share/virtualbox/VBoxGuestAdditions.iso /media/cdrom
	# yes | sudo sh /media/cdrom/VBoxLinuxAdditions.run
	
  SHELL
  
  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options. 
  
end

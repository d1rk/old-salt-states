Vagrant.configure("2") do |config|

  ## Default configuration for Virtualbox
  config.vm.hostname = "web01"
  #config.vm.box = "precise64"
  #config.vm.box_url = 'http://files.vagrantup.com/precise64.box'

  config.vm.box = 'debian-wheezy-64'
  #config.vm.box_url = 'https://www.dropbox.com/s/00ndb5ea4k8hyoy/debian-wheezy-64.box'
  config.vm.box_url = 'https://dl.dropboxusercontent.com/u/86066173/debian-wheezy.box'

  ## configure the hostmanager plugin
  ## requires `vagrant plugin install vagrant-hostmanager`
  config.hostmanager.enabled = true
  config.hostmanager.include_offline = true

  ## For masterless, mount your salt file root
  config.vm.synced_folder "salt/srv/", "/srv/"

  # Forward 8080 to nginx
  config.vm.network :forwarded_port, guest: 80, host: 8080

  config.vm.provision :hostmanager

  ## Use all the defaults:
  config.vm.provision :salt do |salt|

    salt.minion_config = 'salt/minion'
    salt.bootstrap_script = 'salt/bootstrap.sh'
    salt.run_highstate = true
    salt.verbose = true

  end
end
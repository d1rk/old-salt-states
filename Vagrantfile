Vagrant.configure("2") do |config|

  ## Default configuration for Virtualbox
  ## Here, you define which OS you want to use
  config.vm.hostname = "vm01"

  # Ubuntu 12.04 64 LTS (Precise Pangolin)
  #config.vm.box = "precise64"
  #config.vm.box_url = 'http://files.vagrantup.com/precise64.box'

  # Debian Wheezy 64
  config.vm.box = 'debian-wheezy-64'
  config.vm.box_url = 'https://dl.dropboxusercontent.com/u/86066173/debian-wheezy.box'

  ## For masterless, mount your salt file roots
  config.vm.synced_folder "salt", "/srv/salt"
  config.vm.synced_folder "pillar", "/srv/pillar"

  # Forward local 8080 to nginx
  config.vm.network :forwarded_port, guest: 80, host: 8080

  ## Use salt for provisioning
  ## requires `vagrant plugin install vagrant-salt`
  config.vm.provision :salt do |salt|

    salt.minion_config = 'minion'
    salt.bootstrap_script = 'bootstrap.sh'
    salt.run_highstate = true
    salt.verbose = true

  end
end
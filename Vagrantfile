require 'berkshelf/vagrant'

Vagrant::Config.run do |config|
  config.vm.box = "precise64"
  config.vm.provision :chef_solo do |chef|
    chef.add_recipe("tmux")
  end
end

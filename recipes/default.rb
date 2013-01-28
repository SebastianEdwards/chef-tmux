# Install libevent2 and then tmux
# The opscode package breaks b/c it installs an older
# libevent package that doesn't work with tmux 1.7
# Author Josh Dzielak, Copyright 2013 Keen IO

include_recipe "libevent"

tar_name = "tmux-#{node['tmux']['version']}"
remote_file "#{Chef::Config['file_cache_path']}/#{tar_name}.tar.gz" do
  not_if "test -f #{Chef::Config['file_cache_path']}/#{tar_name}.tar.gz"
  source "http://downloads.sourceforge.net/tmux/#{tar_name}.tar.gz"
  checksum node['tmux']['checksum']
  notifies :run, 'bash[install_tmux]', :immediately
end

bash 'install_tmux' do
  user 'root'
  cwd Chef::Config['file_cache_path']
  code <<-EOH
      tar -zxf #{tar_name}.tar.gz
      (cd #{tar_name} && ./configure && make && make install)
    EOH
  action :nothing
end


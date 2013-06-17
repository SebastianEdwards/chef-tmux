# Install libevent2 and then tmux
# The opscode package breaks b/c it installs an older
# libevent package that doesn't work with tmux 1.7
# Author Josh Dzielak, Copyright 2013 Keen IO

include_recipe "libevent"

ncurses_tar_name = "ncurses-#{node['ncurses']['version']}"
remote_file "#{Chef::Config['file_cache_path']}/#{ncurses_tar_name}.tar.gz" do
  not_if "test -f /usr/local/bin/tmux"
  source "http://ftp.gnu.org/pub/gnu/ncurses/#{ncurses_tar_name}.tar.gz"
  notifies :run, 'bash[install_ncurses]', :immediately
end

tar_name = "tmux-#{node['tmux']['version']}"
remote_file "#{Chef::Config['file_cache_path']}/#{tar_name}.tar.gz" do
  not_if "test -f /usr/local/bin/tmux"
  source "http://downloads.sourceforge.net/tmux/#{tar_name}.tar.gz"
  notifies :run, 'bash[install_tmux]', :immediately
end

bash 'install_tmux' do
  user 'root'
  cwd Chef::Config['file_cache_path']
  code <<-EOH
      tar -zxf #{tar_name}.tar.gz
      (cd #{tar_name} && ./configure CFLAGS="-I$HOME/local/include -I$HOME/local/include/ncurses" LDFLAGS="-L$HOME/local/lib -L$HOME/local/include/ncurses -L$HOME/local/include" && CPPFLAGS="-I$HOME/local/include -I$HOME/local/include/ncurses" LDFLAGS="-static -L$HOME/local/include -L$HOME/local/include/ncurses -L$HOME/local/lib" make && make install)
    EOH
  action :nothing
end

bash 'install_ncurses' do
  user 'root'
  cwd Chef::Config['file_cache_path']
  code <<-EOH
      tar -zxf #{ncurses_tar_name}.tar.gz
      (cd #{ncurses_tar_name} && ./configure && make && make install)
    EOH
  action :nothing
end


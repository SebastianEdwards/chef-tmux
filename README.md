# Description

Installs tmux 1.7 (or earlier) from source on Ubuntu. Takes care of installing libevent2 first,
and then tmux. (The current opscode package installs an older package of libevent-dev
which subsequently breaks the tmux build.)

# Requirements

Platform - tested on Ubuntu but should work on most Linii

# Attributes

`node["tmux"]["version"]` - defaults to 1.7

# Usage

Simply include the `tmux` recipe.

This cookbook depends on this [libevent cookbook](https://github.com/tk0miya/chef-libevent).
If you reference this tmux cookbook in your chef configuration, you should add that cookbook
first.

# Try it out with Vagrant

I use [Berkshelf](http://berkshelf.com/) to install and version cookbooks, [Vagrant](http://vagrantup.com/)
to test the cookbooks, and Bundler to install Vagrant and Berkshelf.

First, make sure you have [Vagrant installed](http://docs.vagrantup.com/v1/docs/getting-started/index.html).

Then follow these steps:

    git clone git://github.com/keenlabs/chef-tmux.gif
    cd chef-tmux
    bundle install
    bundle exec berks install
    bundle exec vagrant up

That should boot the virtual machine and install libevent2 and tmux. You can then SSH into
the new virtual machine:

    bundle exec vagrant ssh

From the VM shell, you should be able to launch tmux 1.7.

    tmux

# License

Copyright (c) 2013, Keen IO

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

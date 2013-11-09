#!/usr/bin/env bash

if [ ! -f tmp/erlang-repos-added ]; then
	# Grab the repository package and install
    wget http://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb
    sudo dpkg -i erlang-solutions_1.0_all.deb

    # Note that we've been here
    mkdir -p tmp
    touch tmp/erlang-repos-added

    # Update our repository lists
    sudo apt-get update -y

    # Remove the package
    rm erlang-solutions_1.0_all.deb
fi

# Install/update erlang
sudo apt-get install -y erlang


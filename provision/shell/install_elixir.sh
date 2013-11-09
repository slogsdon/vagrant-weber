#!/usr/bin/env bash

# Clone the repo
if [ ! -d "elixir" ]; then
    git clone https://github.com/elixir-lang/elixir.git
    cd elixir
else
    cd elixir
    git pull
fi

# Get our HEADs to test if an update is necessary
mkdir -p ../tmp
touch ../tmp/elixir-head
INSTALLED_HEAD=$(cat ../tmp/elixir-head)
REPO_HEAD=$(cat .git/refs/heads/master)

if [ "$INSTALLED_HEAD" == "$REPO_HEAD" ]; then
    # Nothing to do here
    echo
    echo 'Elixir is up to date'
    echo
else
    # Install/Update Elixir
    echo
    echo 'Buidling Elixir'
    echo

    # Run build script
    make clean test
    wait

    # Save our current HEAD
    echo "$REPO_HEAD" > ../tmp/elixir-head
fi

# Add elixir/bin to PATH
touch /home/vagrant/.bash_profile
BASH_PROFILE=$(cat /home/vagrant/.bash_profile | grep "elixir/bin")
if [ "$BASH_PROFILE" == "" ]; then
    echo 'export PATH=$PATH:/home/vagrant/elixir/bin' >> /home/vagrant/.bash_profile
    source /home/vagrant/.bash_profile
fi

# Clean up
cd /home/vagrant


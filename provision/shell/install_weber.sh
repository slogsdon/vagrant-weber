#!/usr/bin/env bash

# Clone the repo
if [ ! -d "weber" ];then
    git clone https://github.com/0xAX/weber.git
    cd weber
else
    cd weber
    git pull
fi

# Get our HEADs to test if an update is necessary
mkdir -p ../tmp
touch ../tmp/weber-head
INSTALLED_HEAD=$(cat ../tmp/weber-head)
REPO_HEAD=$(cat .git/refs/heads/master)

if [ "$INSTALLED_HEAD" == "$REPO_HEAD" ]; then
    # Nothing to do here
    echo
    echo 'Weber is up to date'
    echo
else
    # Install/Update Weber
    echo
    echo 'Buidling Weber'
    echo

    # Run build scriptls -la
    mix deps.get && mix deps.compile # ensures dependencies get pulled correctly
    yes | make # yes answers question about installing local rebar
    wait
    make test
    wait
    echo "$REPO_HEAD" > ../tmp/weber-head
fi

if [ -d ../weber ] && [ ! -d "/vagrant/$PROJECT_NAME" ]; then
    echo "mix weber.new /vagrant/$PROJECT_NAME" | bash
fi

# Clean up
cd /home/vagrant
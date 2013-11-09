vagrant-weber
=============

a template for using Vagrant for developing Elixir applications with Weber

## Getting Started

1. Download and install [VirtualBox](https://www.virtualbox.org/)
2. Download and install [Vagrant](http://www.vagrantup.com/)
3. Clone this repo and `cd` into the directory
4. Run `vagrant up` to set up the vm
5. Run `sh start_in_vagrant.sh` to run weber
6. Visit `http://localhost:8080/` in your favorite browser

> ### Note
>
> The default project name is 'weber_test', so be sure to update `weber_project_name` in the `Vagrantfile` to 
> reflect your needs.

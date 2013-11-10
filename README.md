vagrant-weber
=============

a template for using Vagrant for developing Elixir applications with Weber

## Getting Started

1. Download and install [VirtualBox](https://www.virtualbox.org/)
2. Download and install [Vagrant](http://www.vagrantup.com/)
3. Clone this repo and `cd` into the directory
4. Run `vagrant up` to set up the vm
5. Run `vagrant ssh` to start a session on the vm
6. Run `cd /vagrant/[you project name] && ./start.sh` to run weber
7. Visit `http://localhost:8080/` in your favorite browser

## TODO

- Find a way to exit `iex` when using `./start_in_vagrant.sh`

> ##### Note
>
> The default project name is 'weber_test', so be sure to update `weber_project_name` in the `Vagrantfile` to 
> reflect your needs.

[![githalytics.com alpha](https://cruel-carlota.pagodabox.com/5896d6c53b95330624df3109b75c2bab "githalytics.com")](http://githalytics.com/slogsdon/vagrant-weber)

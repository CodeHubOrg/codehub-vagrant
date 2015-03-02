## Instructions

- Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) and [Vagrant](http://www.vagrantup.com/downloads.html)
- *Linux Users:* Install an NFS daemon, e.g. `apt-get install nfs-kernel-server`
- Clone the codehub repo into a folder called 'codehub' `git clone git@github.com:CodeHubOrg/CodeHub.git codehub`
- In the same directory the 'codehub' folder resides clone this repo `git clone git@github.com:CodeHubOrg/codehub-vagrant.git`
- CD into the codehub-vagrant folder
    - Initialise and fetch submodules
        - `git submodule init`
        - `git submodule update --recursive`
    - Run `vagrant up`
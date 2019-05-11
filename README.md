# Setting Up Local Docker Dev Environment for PHP 7 & Mongo 3

## General
* Tested on OS-X v10.13 with:
    * docker desktop 2.0.0.2
    * docker 18.09.1
    * docker-compose 1.23.2

## Edit the .env file
* Edit the `.env` file and set `CODE_DIR_HOST` to reflect the location of the source code on your host machine.
* `CODE_DIR_CONTAINER` is set to `/var/www/html`, if this is altered then `root` within `nginx/default.conf` will also need updating.
    * currently `root` in `default.conf` is set to `/var/www/html/web` to serve Symfony 3.
* Set `MONGO_DATA_DIR_HOST` to directory on host machine for storing MongoDB data.
     
## Install docker-sync
* [docker-sync](https://docker-sync.readthedocs.io/en/latest/index.html#) is used to improve read/write access for mounted volumes.
* [Install docker-sync](https://docker-sync.readthedocs.io/en/latest/getting-started/installation.html), for instance:


    gem install docker-sync --user-install


## Bring up the stack
    docker-sync-stack start

* Add an entry to your `/etc/hosts` file if you want to use a domain name.
    
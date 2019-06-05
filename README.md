# Docker Development Environment for Nginx, PHP & Mongo

## General
* Tested on OS-X v10.14 with:
  * docker desktop 2.0.0.3
  * docker 18.09.2
  * docker-compose 1.23.2

## Intended Use
This development environment has been created for use with a [Symfony API](https://github.com/bendbennett/symfony-api-swagger-jwt), but should be suitable for general use where Nginx, PHP and Mongo are required.
* nginx - 1.17
* php-fpm - 7.3 (incl. mongodb extension)
* mongo - 4.0 (seeded with admin user)

## Edit the .env file
* Edit the `.env` file and set `CODE_DIR_HOST` to reflect the location of the source code on your host machine.
* `CODE_DIR_CONTAINER` is set to `/var/www/html`, if this is altered then `root` within `nginx/default.conf` will also need updating and the `volumes` directive for `nginx` will need uncommenting in `docker-compose.yml`
    * currently `root` in `default.conf` is set to `/var/www/html/public` to serve Symfony 4.
* Set `MONGO_DATA_DIR_HOST` to directory on host machine for storing MongoDB data.
     
## Install docker-sync
* [docker-sync](https://docker-sync.readthedocs.io/en/latest/index.html#) is used to improve read/write access for mounted volumes.
* [Install docker-sync](https://docker-sync.readthedocs.io/en/latest/getting-started/installation.html), for instance:

      gem install docker-sync --user-install

## Bring up the stack
    docker-sync-stack start

* Add an entry to your `/etc/hosts` file if you want to use a domain name.
    
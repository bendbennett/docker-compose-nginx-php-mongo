# Setting Up Local Docker Dev Environment for PHP 7 & Mongo 3

## General
* Tested on OS-X v10.11 with:
    * Docker version 1.12.0
    * docker-compose version 1.8.0
    * docker-machine version 0.8.0 

## Edit the .env file
* Edit the `.env` file and set `CODE_DIR_HOST` to reflect the location of the source code on your host machine.
* `CODE_DIR_GUEST` is set to `/var/www/code`, if this is altered then `root` within `nginx/default.conf` will also need updating.
    * currently `root` in `default.conf` is set to `/var/www/code/web` to serve Symfony 2.
     
## Run docker-compose up
* `cd` into the directory containing `docker-compose.yml`
* Run `docker-compose up -d`
* Add an entry to your `/etc/hosts` file if you want to use a domain name.
    * you can get the docker-machine ip by running `docker-machine ip`

## Run docker-machine-nfs
* In order to improve request-response time install `docker-machine-nfs`
    * https://github.com/adlogix/docker-machine-nfs
    * see https://forums.docker.com/t/how-to-speed-up-shared-folders/9322/1
* Then run `docker-machine-nfs default`
    * if you see error messages relating to conflicts with Vagrant nfs mounts then edit `/etc/exports` and comment out the Vagrant mount(s)
        * see https://github.com/adlogix/docker-machine-nfs/issues/48  
    * to remove the nfs mount:
        * `docker-machine ssh`
        * `rm /var/lib/boot2docker/bootlocal.sh`
            * see https://github.com/adlogix/docker-machine-nfs/issues/34      
    
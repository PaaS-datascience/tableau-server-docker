# tableau-server-beta-docker
Dockerfile for Tableau Server on Linux - Single Node. 

## Build
   
Be sure that your `EDITOR` environment variable is set then simply call `make`:

    make build
    
## Run image

To boot (run) Tableau Server container simply execute:

    make up

**(Broken)** It will call a `systemd` `/sbin/init` on the image and configure, register and start tableau server
on the first start.

## Init tableau

To initialize and Tableau Server container simply execute the first time:

    make init

# Stop & start tableau service
To stop and Tableau Server, without shutting down the container :

    make stop

To start:

    make start
    
# Stop container
To stop the container:

    make down
    
# erase config & data
To erase the config and build a new one:

   make clean

## Volumes

- tableau data : data/
- logs : log/
- tableau running env: run/
- **(broken)**: config after install : etc/


## Creds

This is a fork from [@tfoldi](https://twitter.com/tfoldi), focusing on Tableau server 2018.2


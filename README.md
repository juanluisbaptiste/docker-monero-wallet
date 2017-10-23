
# Unofficial bitmonero Monero wallet and daemon for docker

Unofficial [monero](http://www.getmonero.org/) wallet and daemon docker images. This repository contains the
*Dockerfiles* and all other files needed to build and run these containers. Having the wallet available as docker container has some advantages like:

* Run the wallet on non supported platforms like Synology NAS products.
* Run the daemon on a server that is always on and connected to the Internet like a Synology NAS, and avoid the long blockchain sync waits each time the monerod daemon is started in your laptop.

## Build instructions

We use `docker-compose` to build the images. Clone this repo and then:

    cd docker-monero-wallet
    sudo docker-compose -f docker-compose-dev.yml build

This command will build the wallet and the monero daemon as separate images that you can launch independently.

## How to run the Wallet

The `docker-compose` file mounts your X11 session's socket (/tmp/.X11-unix) so the container can connect back to your X server. To start the wallet with `docker-compose`:

    sudo docker-compose -p monerowallet up

This will pull and bring up all needed containers, link them and mount volumes according to the `docker-compose-prod.yml` configuration file.

To start the containers in production mode the the `-d` parameter to the previous command:

    sudo docker-compose -p monerowallet up -d

You can see the container logs with this command:

  sudo docker-compose -p monerowallet logs -f

After the containers finish starting up the Monero wallet will show up to be used as usual.

### Running the monerod daemon only

If you just want to start the monerod daemon then you can only start the monerod container:

    sudo docker-compose -f docker-compose-prod.yml -p monerowallet monerod up -d

The `docker-compose` file exposes to the host the port 18081 so you can connect with your local desktop wallet (in that case you should configure an username and password for the daemon).

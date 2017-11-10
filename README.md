
# Unofficial Monero wallet GUI and daemon for docker

Unofficial [monero](http://www.getmonero.org/) wallet GUI docker image to be run standalone or inside a browser window using [Xpra](https://www.xpra.org/).

Having the wallet available as docker container has some advantages like:

* Run the wallet GUI on a remote server inside a web browser window.
* Run the wallet GUI locally without installing package dependencies.
* Easier updating when new versions are available.
* Run only the daemon on a remote server, and avoid the long blockchain sync waits each time the monerod daemon is started in your laptop.

## Build instructions

We use `docker-compose` to build the images. Clone this repository and then:

    cd docker-monero-wallet
    sudo docker-compose -f docker-compose-dev.yml build

This command will build the wallet and the monero daemon as separate images that
you can launch independently.

## How to run the Wallet

The wallet can be run in two ways:

* As a standalone X11 application
* Inside a web browser window using [Xpra](https://www.xpra.org/).

Currently the separate _monerod_ container is still _under development_, so the wallet will start the daemon up as when run in your desktop.

### Standalone wallet

The `docker-compose` file mounts your X11 session's socket (/tmp/.X11-unix) so the container can connect back to your X server. To start the wallet with `docker-compose`:

    sudo docker-compose -p monerowallet up

<!--This will pull and bring up monerod and wallet containers, link them and mount
volumes according to the `docker-compose.yml` configuration file.
-->
To start the wallet in production mode the the `-d` parameter to the previous
command:

    sudo docker-compose -p monerowallet up -d

You can see the container logs with this command:

  sudo docker-compose -p monerowallet logs -f

After the container finish starting up the Monero wallet will show up in your
screen

### Web view wallet

This is useful to run the wallet (and leave it running if you want) on a remote server and avoid wasting huge amounts of space locally holding the blockchain copy. I run it on a Synology NAS, which compared to my laptop it has tons of spare space and is always on and connected to the Internet.

To run the wallet inside a web browser you need to define the environment variable `ENABLE_WEB_VIEW=yes`. Then start the wallet with `docker-compose` as before:

    sudo docker-compose -p monerowallet up

After some minutes the wallet will be available in http://[host]:10000, were host is the server name or IP address of the server running the wallet container.

![alt text](https://raw.githubusercontent.com/juanluisbaptiste/docker-monero-wallet/master/img/wallet_open_web.png "Monero wallet running on a web browser")

You can change the port using the environment variable `WEB_VIEW_PORT`.

**Note**: Firefox is recommended, I have had issues with chrome when repainting the browser screen.

## Running the monerod daemon only

If you just want to start the monerod daemon, for example to have it running
permanently on a remote server or a NAS system, you can only start the monerod
container:

    sudo docker-compose -f docker-compose-prod.yml -p monerowallet monerod up -d

The `docker-compose` file exposes to the host the port 18081 so you can connect
with your local desktop wallet (in that case you should configure an username
and password for the daemon).

## Debugging
To enable debug output, set the environment variable `DEBUG=yes`.

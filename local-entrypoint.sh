#!/bin/bash
env > .envrc
echo CMD="/home/monero/monero-gui/start-gui.sh" >> .envrc

. /entrypoint.sh

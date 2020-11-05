#!/bin/bash
env > .envrc
echo CMD="/home/monero/monero-gui/monero-wallet-gui" >> .envrc

. /entrypoint.sh

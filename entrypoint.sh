#!/bin/bash

xpra start --bind-tcp=0.0.0.0:10000 --html=on --start=/home/monero/monero-gui/start-gui.sh --daemon=no --pulseaudio=no --notifications=no --bell=no
xvfb-run --server-args="-screen 0, 1600x1200x24"

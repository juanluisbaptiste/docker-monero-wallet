#!/bin/bash

#Use Xpra to enable access through a web browser
if [ "${ENABLE_WEB_VIEW}" == "yes" ]; then
  xpra start --bind-tcp=0.0.0.0:10000 --html=on --start=/home/monero/monero-gui/start-gui.sh --daemon=no --pulseaudio=no --notifications=no --bell=no
  xvfb-run --server-args="-screen 0, 1600x1200x24"
else
  /home/monero/monero-gui/start-gui.sh
fi

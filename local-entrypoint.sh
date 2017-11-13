#!/bin/bash

if [ "${DEBUG}" == "yes" ]; then
  env
  set -x
fi

#Use Xpra to enable access through a web browser
if [ "${ENABLE_WEB_VIEW}" == "yes" ]; then
  xpra start --bind-tcp=0.0.0.0:${WEB_VIEW_PORT} --html=on --start=/home/monero/monero-gui/start-gui.sh --daemon=no --pulseaudio=no --notifications=no --bell=no
  xvfb-run --server-args="-screen 0, 1600x1200x24 -displayfd ${DISPLAY}"
else
  /home/monero/monero-gui/start-gui.sh
fi
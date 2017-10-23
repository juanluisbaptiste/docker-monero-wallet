#!/bin/bash
env
DEFAULT_LOG_LEVEL=1
if env | grep -q ^LOG_LEVEL=
then
  echo "LOG_LEVEL set to ${LOG_LEVEL}"
else
  echo "LOG_LEVEL not set, setting default value (LOG_LEVEL=$DEFAULT_LOG_LEVEL)."
  LOG_LEVEL=$DEFAULT_LOG_LEVEL
  export LOG_LEVEL
fi
supervisord -c /etc/supervisor/supervisord.conf

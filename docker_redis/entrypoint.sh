#!/bin/bash
# -------------------------------
set -e
# -------------------------------
REDIS_PATH='/opt/redis_5.0.5/bin'
REDIS_CMD='redis-server'
REDIS_CONF='/root/redis.conf'
REDIS_OPTIONS=''
# -------------------------------
if [[ "${1}" != "" ]]
then
    ${REDIS_PATH}/${@}
else
    echo '[ERROR]: No redis commands...'
    exit 1
fi
# -------------------------------
# EOF

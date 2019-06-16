#!/bin/bash
# -------------------------------
set -e
# -------------------------------
REDIS_FLAG=false
REDIS_PATH='/opt/redis_5.0.5/bin'
REDIS_COMMANDS="redis-cli \
                redis-server"
# -------------------------------
for redis_cmd in ${REDIS_COMMANDS}
do
    if [[ ${1} == ${redis_cmd} ]]
    then
        REDIS_FLAG=true
    fi
done
# -------------------------------
if [[ ${REDIS_FLAG} == true ]]
then
    echo 'OK!'
    #${REDIS_PATH}/${@}
else
    echo '[ERROR]: No such Redis command...'
    exit 1
fi
# -------------------------------
# EOF

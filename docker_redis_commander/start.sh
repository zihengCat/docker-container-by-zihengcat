#!/bin/bash
# ----------------------------------------------
# Bash Script for starting `redis-commander`
# in a Docker Container, written by `zihengCat`.
# ----------------------------------------------
# nohup sh start.sh > /dev/null 2>&1 &
# ----------------------------------------
REDIS_HOST=''
REDIS_PORT=''
REDIS_DBINDEX=''
REDIS_PASSWORD=''
REDIS_LABEL='Redis_Node'
# --------------------------
REDIS_COMMANDER_PATH='/root/node_modules/redis-commander/bin/redis-commander.js'
REDIS_COMMANDER_PORT='8080'
# --------------------------
node ${REDIS_COMMANDER_PATH} \
        --redis-host ${REDIS_HOST} \
        --redis-port ${REDIS_PORT} \
        --redis-db ${REDIS_DBINDEX} \
        --redis-password ${REDIS_PASSWORD} \
        --redis-label ${REDIS_LABEL} \
        --port ${REDIS_COMMANDER_PORT} \
        --noload \
        --nosave \
        --no-log-data \
        --clear-config
# --------------------------
# EOF

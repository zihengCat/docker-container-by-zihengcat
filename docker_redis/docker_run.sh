#!/bin/bash
# ------------------------------
REDIS_OPTIONS="--loglevel verbose \
               --bind 0.0.0.0 \
               --port 6379 \
               --requirepass foobar123 \
               --maxclients 10000 \
               --timeout 0 \
               --tcp-keepalive 300 \
               --daemonize no \
               --supervised no \
               --pidfile none \
               --databases 32 \
               --always-show-logo yes \
               --appendonly no \
               --appendfsync no"
# ------------------------------
sudo docker run -d -i -t \
                --env LC_ALL=en_US.UTF-8 \
                --name redis \
                -p 0.0.0.0:6379:6379 \
                ziheng/centos:redis \
                ${REDIS_OPTIONS}
#/usr/sbin/init
# ------------------------------
# EOF

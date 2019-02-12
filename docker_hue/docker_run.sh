#!/bin/bash
# ---------------------
# 8000 -> Hue webserver
# ---------------------
sudo docker run -d -i -t \
                --env LC_ALL=en_US.UTF-8 \
                --name hue \
                -p 0.0.0.0:8000:8000 \
                ziheng/centos:cloudera_hue \
                /usr/sbin/init

#!/bin/bash
sudo docker run -d -i -t \
                --env LC_ALL=en_US.UTF-8 \
                --name redis \
                -p 0.0.0.0:6379:6379 \
                ziheng/centos:redis /usr/sbin/init

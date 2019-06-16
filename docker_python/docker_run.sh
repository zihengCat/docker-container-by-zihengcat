#!/bin/bash
# ----------------------------------------
sudo docker run -d -i -t \
                --env LC_ALL=en_US.UTF-8 \
                --name python_test \
                ziheng/centos:python \
                /usr/sbin/init
# ----------------------------------------
# EOF

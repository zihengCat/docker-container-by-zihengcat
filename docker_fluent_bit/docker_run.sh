#!/bin/bash
sudo docker run -d -i -t \
                --env LC_ALL=en_US.UTF-8 \
                --name fluent_bit_dev \
                ziheng/centos:fluent_bit /usr/sbin/init
# EOF

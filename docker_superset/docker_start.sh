#!/bin/bash
# --------------------------
# 3306 -> mariadb
# 6379 -> redis
# --------------------------
# 8088 -> superset runserver
# --------------------------
sudo docker run -d -i -t \
                --env LC_ALL=en_US.UTF-8 \
                --name superset \
                -p 0.0.0.0:8088:8088 \
                ziheng/centos:apache_superset /usr/sbin/init

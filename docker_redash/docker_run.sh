#!/bin/bash
# ------------------------
# 5432 -> PostgreSQL
# 6379 -> Redis
# ------------------------
# 8080 -> Webpack Server
# 5000 -> Flask Web Server
# ------------------------
sudo docker run -d -i -t \
                --env LC_ALL=en_US.UTF-8 \
                --name redash \
                -p 0.0.0.0:8080:8080 \
                ziheng/centos:redash /usr/sbin/init

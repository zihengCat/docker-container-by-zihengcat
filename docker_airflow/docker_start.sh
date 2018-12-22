#!/bin/bash
# -------------------------
# 3306 -> mariadb
# 6379 -> redis
# -------------------------
# 8080 -> airflow webserver
# 8793 -> airflow worker
# 5555 -> airflow flower
# -------------------------
sudo docker run -d -i -t \
                --env LC_ALL=en_US.UTF-8 \
                --name airflow \
                -p 0.0.0.0:8080:8080 \
                -p 0.0.0.0:8793:8793 \
                -p 0.0.0.0:5555:5555 \
                ziheng/centos:apache_airflow /usr/sbin/init

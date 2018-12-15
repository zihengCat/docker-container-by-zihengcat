# -----------------------------------------------
# `Dockerfile_Kibana` written by zihengCat
# -----------------------------------------------
# =============================
# Using Base OS CentOS 7 Latest
# =============================
FROM       docker.io/centos:latest
# ==========================
# MAINTAINER is `deprecated`
# ==========================
#MAINTAINER zihengCat
LABEL      maintainer "zihengCat"
# ==================================
# Environment Variables Substitution
# ==================================
ENV        LANG     en_US.UTF-8
ENV        LANGUAGE en_US.UTF-8
ENV        LC_ALL   en_US.UTF-8
# ----------------------------------
#ENV        PKG_BASE_DEPS="java-11-openjdk-headless.x86_64"
ENV        PKG_MIRROR_URL="https://artifacts.elastic.co/downloads/kibana/kibana-6.5.3-linux-x86_64.tar.gz"
# =================================================
# 1. Install Java 11 (OpenJDK 11)
# 2. Download ElasticSearch `*.tar.gz` to Container
# =================================================
RUN        cp "/usr/share/zoneinfo/Asia/Shanghai" "/etc/localtime" && \
           echo "Asia/Shanghai" > /etc/timezone && \
           useradd "elastic" && \
           curl -o "/home/elastic/kibana-6.5.3-linux-x86_64.tar.gz" ${PKG_MIRROR_URL}
# ===============================
#USER       elastic
#WORKDIR    /home/elastic/
WORKDIR    /root/
# ===============================
# EOF

# -----------------------------------------------
# `Dockerfile_ElasticSearch` written by zihengCat
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
#ENV        PKG_MIRROR_URL="https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.5.4.tar.gz"
# =========================================================
# 1. Setting TimeZone
# 2. Install Java 11 (OpenJDK 11)
# 3. Download `elasticsearch-x.y.z.tar.gz` to the Container
# 4. Clean caches
# =========================================================
#RUN        cp "/usr/share/zoneinfo/Asia/Shanghai" "/etc/localtime" && \
#           echo "Asia/Shanghai" > /etc/timezone && \
#           yum -y install ${PKG_BASE_DEPS} && \
#           useradd "elastic" && \
#           curl -o "/home/elastic/elasticsearch-6.5.4.tar.gz" ${PKG_MIRROR_URL} && \
#           yum clean all
# ===============================
#USER       elastic
#WORKDIR    /home/elastic/
WORKDIR    /root/
# ===============================
# EOF

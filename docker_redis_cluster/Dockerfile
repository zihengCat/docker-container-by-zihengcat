# -------------------------------
# Dockerfile written by zihengCat
# -------------------------------
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
ENV        PKG_BASE_DEPS="epel-release \
                          make gcc gcc-c++ \
                          jemalloc-devel"
ENV        REDIS_PKG_PATH="/root/redis-5.0.2.tar.gz"
ENV        REDIS_PKG_URL="http://download.redis.io/releases/redis-5.0.2.tar.gz"
# ==================================
RUN        cp "/usr/share/zoneinfo/Asia/Shanghai" "/etc/localtime" && \
           echo "Asia/Shanghai" > /etc/timezone && \
           yum -y install "epel-release" && \
           yum -y install ${PKG_BASE_DEPS} && \
           curl -o ${REDIS_PKG_PATH} ${REDIS_PKG_URL} && \
           cd /root/ && \
           tar -xvz -f ${REDIS_PKG_PATH} && \
           cd /root/redis-5.0.2 && \
           make && \
           cp -r /root/redis-5.0.2/ /opt/redis_5.0.2/ && \
COPY       redis_cluster /root/redis_cluster
# ==================================
#WORKDIR    /root/
# ==================================
# EOF

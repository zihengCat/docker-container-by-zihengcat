# -------------------------
#  Dockerfile - Redis Nodes
#  Author: zihengCat
#  Version: 1.0.0
# -------------------------
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
ENV        PKG_BASE_DEPS="epel-release \
                          make gcc gcc-c++ \
                          jemalloc-devel"
# =====================================
# Download latest Redis Release Package
# >> https://redis.io/
# =====================================
ENV        REDIS_PKG_PATH="/root/redis-5.0.3.tar.gz"
ENV        REDIS_PKG_ROOT="/root/redis-5.0.3/"
ENV        REDIS_PKG_INSTALLED="/opt/redis_5.0.3/"
ENV        REDIS_PKG_URL="http://download.redis.io/releases/redis-5.0.3.tar.gz"
# ==================================
RUN        cp "/usr/share/zoneinfo/Asia/Shanghai" "/etc/localtime" && \
           echo "Asia/Shanghai" > /etc/timezone && \
           yum -y install "epel-release" && \
           yum -y install ${PKG_BASE_DEPS} && \
           curl -o ${REDIS_PKG_PATH} ${REDIS_PKG_URL} && \
           cd "/root/" && \
           tar -xvz -f ${REDIS_PKG_PATH} && \
           cd ${REDIS_PKG_ROOT} && \
           make && \
           cp -r ${REDIS_PKG_ROOT} ${REDIS_PKG_INSTALLED} && \
           rm -rf ${REDIS_PKG_ROOT} ${REDIS_PKG_PATH} && \
           yum -y autoremove ${PKG_BASE_DEPS} && \
           yum clean all
# ===============================
WORKDIR    /root/
# ===============================
# EOF

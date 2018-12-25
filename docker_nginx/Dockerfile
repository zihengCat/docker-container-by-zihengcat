# -------------------------------
#  Dockerfile - Nginx
#  Author: zihengCat
#  Version: 1.0.0
# -------------------------------
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
ENV        PKG_BASE_DEPS="gcc"
# ----------------------------------
ENV        NGINX_PKG_ROOT="/root/nginx-1.14.2"
ENV        NGINX_PKG_PATH="/root/nginx-1.14.2.tar.gz"
ENV        NGINX_PKG_URL="http://nginx.org/download/nginx-1.14.2.tar.gz"
# =========================================================
# 1. Setting TimeZone(UTC+8)
# 2. Install System Level Packages
# 3. Download `nginx-X.Y.Z.tar.gz` to Container
# 3. Clean Caches
# =========================================================
RUN        cp "/usr/share/zoneinfo/Asia/Shanghai" "/etc/localtime" && \
           echo "Asia/Shanghai" > /etc/timezone && \
           yum -y install ${PKG_BASE_DEPS} && \
           curl -o ${NGINX_PKG_PATH} ${NGINX_PKG_URL} && \
           cd "/root/" && \
           tar -xvz -f ${NGINX_PKG_PATH} && \
           cd ${NGINX_PKG_ROOT} && \
           yum -y autoremove ${PKG_BASE_DEPS} && \
           yum clean all
# ===============================
WORKDIR    /root/
# ===============================
# EOF

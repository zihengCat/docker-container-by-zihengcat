# -----------------------------
#  Dockerfile - Redis Commander
#  Author: zihengCat
#  Version: 1.0.0
# -----------------------------
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
ENV 	   CONFIG_FILE="start.sh"
ENV 	   NPM_MIRROR_URL="https://registry.npm.taobao.org/"
# =====================================================
# 1. Setting TimeZone(UTC+8)
# 2. Install EPEL Yum Repo
# 3. Install `Node.js` from EPEL Yum Repo
# 4. Install `redis-commander` from NPM Repo
# 5. Copy `redis-commander` Configurations to Container
# 6. Clean Caches
# =====================================================
# ** NOTE **
# -----------------------------------------------------
# Using `redis-commander@0.4.5`
# rather than the latest version.
# =====================================================
RUN        cp "/usr/share/zoneinfo/Asia/Shanghai" "/etc/localtime" && \
           echo "Asia/Shanghai" > /etc/timezone && \
           yum -y install "epel-release" && \
           yum -y install "nodejs" && \
           cd "/root/" && \
           npm --registry ${NPM_MIRROR_URL} \
                 install "redis-commander@0.4.5" && \
           yum clean all && \
           npm cache clean
# ----------------------------------
COPY       ${CONFIG_FILE} /root/
# ===============================
WORKDIR    /root/
# ===============================
# EOF

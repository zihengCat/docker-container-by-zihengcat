# ----------------------------
# `Dockerfile_redis_commander`
# ----------------------------
#  >> written by `zihengCat`.
# ----------------------------
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
ENV 	   NPM_MIRROR_URL="https://registry.npm.taobao.org"
# =====================================================
# 1. Install EPEL Yum Repo
# 2. Install `Node.js` from EPEL Yum Repo
# 3. Install `redis-commander` from NPM
# 4. Copy `redis-commander` Configurations to Container
# =====================================================
RUN        yum -y install "epel-release" && \
           yum -y install "nodejs" && \
           cd "/root/" && \
           npm --registry ${NPM_MIRROR_URL} \
                 install  "redis-commander"
#COPY
# ===============================
WORKDIR    /root/
# ===============================
# EOF

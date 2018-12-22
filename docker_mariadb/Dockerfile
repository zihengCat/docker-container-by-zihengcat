# -----------------------------------------
# `Dockerfile_MariaDB` written by zihengCat
# -----------------------------------------
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
ENV        PKG_BASE_DEPS="mariadb \
                          mariadb-devel \
                          mariadb-server"
# =========================================================
# 1. Setting TimeZone
# 2. Install MariaDB
# 3. Clean Caches
# =========================================================
RUN        cp "/usr/share/zoneinfo/Asia/Shanghai" "/etc/localtime" && \
           echo "Asia/Shanghai" > /etc/timezone && \
           yum -y install ${PKG_BASE_DEPS} && \
           yum clean all
# ===============================
WORKDIR    /root/
# ===============================
# EOF

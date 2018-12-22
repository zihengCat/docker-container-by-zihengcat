# ------------------------------------------------
# `Dockerfile_Apache_Airflow` written by zihengCat
# ------------------------------------------------
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
# mariadb-5.5.56-2.el7.x86_64
# mariadb-libs-5.5.56-2.el7.x86_64
# mariadb-devel-5.5.56-2.el7.x86_64
# mariadb-server-5.5.56-2.el7.x86_64
# ----------------------------------
ENV        PKG_BASE_DEPS="epel-release \
                          python36 python36-devel \
                          mariadb mariadb-libs mariadb-server mariadb-devel \
                          gcc gcc-c++ \
                          git openssh-clients sshpass"
# ----------------------------------
#ENV        PIP_MIRROR_URL="https://mirrors.aliyun.com/pypi/simple/"
#ENV        PKG_AIRFLOW="apache-airflow[crypto,password,mysql,redis]==1.9.0"
# =========================================================
# 1. Setting TimeZone
# 2. Install Python 3.6.6, MadiaDB 5.5.60, GCC 4.8.5
# 4. Install `apache-airflow==1.9.0`
# 3. Clean Caches
# =========================================================
RUN        cp "/usr/share/zoneinfo/Asia/Shanghai" "/etc/localtime" && \
           echo "Asia/Shanghai" > /etc/timezone && \
           yum -y install "epel-release" && \
           yum -y install ${PKG_BASE_DEPS} && \
           yum clean all
# ===============================
WORKDIR    /root/
# ===============================
# EOF

# ----------------------------
#  Dockerfile - Apache Airflow
#  Author: zihengCat
#  Version: 1.0.0
# ----------------------------
# ================================
# Using Base OS -> CentOS 7 Latest
# ================================
FROM       docker.io/centos:latest
# ==========================
# MAINTAINER is `deprecated`
# ==========================
#MAINTAINER zihengCat
# =============================================
# LABEL following the standard set of labels by
# The Open Containers Initiative (OCI)
# =============================================
LABEL      org.opencontainers.image.title="DockerImage - Apache Airflow" \
           org.opencontainers.image.description="A docker image contains Apache Airflow with dependents based on CentOS 7 Linux." \
           org.opencontainers.image.authors="zihengCat" \
           org.opencontainers.image.version="1.0.0" \
           org.opencontainers.image.licenses="MIT" \
           org.opencontainers.image.url="https://github.com/zihengCat/docker-container-by-zihengcat"
# ==================================
# Environment Variables Substitution
# ==================================
#ENV        LANG     en_US.UTF-8
#ENV        LANGUAGE en_US.UTF-8
#ENV        LC_ALL   en_US.UTF-8
# ----------------------------------------------
# ** Old MariaDB 5.5.56 Versions (deprecated) **
# ----------------------------------------------
# mariadb-5.5.56-2.el7.x86_64
# mariadb-libs-5.5.56-2.el7.x86_64
# mariadb-devel-5.5.56-2.el7.x86_64
# mariadb-server-5.5.56-2.el7.x86_64
# ----------------------------------------------
#ENV        PKG_BASE_DEPS="epel-release \
#                          python36 python36-devel \
#                          mariadb mariadb-libs mariadb-server mariadb-devel \
#                          redis \
#                          gcc gcc-c++ \
#                          git openssh-clients sshpass screen supervisor"
# ----------------------------------------------
#ENV        PKG_AIRFLOW="apache-airflow[crypto,password,mysql,redis,celery]==1.9.0"
#ENV        PIP_MIRROR_URL="https://mirrors.aliyun.com/pypi/simple/"
# ================================================================
# 1. Setting TimeZone(UTC+8)
# 2. Install Python 3.6.6, MariaDB 5.5.60, Redis 3.2.12, GCC 4.8.5
# 4. Install `apache-airflow[*]==1.9.0`
# 3. Clean Caches
# ================================================================
RUN        PKG_BASE_DEPS="epel-release \
                          python36 python36-devel \
                          mariadb mariadb-libs mariadb-server mariadb-devel \
                          redis \
                          gcc gcc-c++ \
                          git openssh-clients sshpass screen supervisor" && \
           PKG_AIRFLOW="apache-airflow[crypto,password,mysql,redis,celery]==1.9.0" && \
           PIP_MIRROR_URL="https://mirrors.aliyun.com/pypi/simple/" && \
           cp "/usr/share/zoneinfo/Asia/Shanghai" "/etc/localtime" && \
           echo "Asia/Shanghai" > "/etc/timezone" && \
           yum -y install "epel-release" && \
           yum -y install ${PKG_BASE_DEPS} && \
           python36 -m venv /root/airflow_py3/ && cd /root/airflow_py3/ && \
           source bin/activate && \
           pip install ${PKG_AIRFLOW} -i ${PIP_MIRROR_URL} --no-cache-dir && \
           deactivate && \
           yum clean all
# ===============================
# - 8080 -> airflow webserver
# - 8793 -> airflow worker
# - 5555 -> airflow flower
# ===============================
#EXPOSE 8080
#EXPOSE 8793
#EXPOSE 5555
# ===============================
#WORKDIR    /root/
# ===============================
# EOF

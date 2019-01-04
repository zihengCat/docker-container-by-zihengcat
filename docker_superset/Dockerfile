# -----------------------------
#  Dockerfile - Apache Superset
#  Author: zihengCat
#  Version: 1.0.0
# -----------------------------
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
LABEL      org.opencontainers.image.title="DockerImage - Apache Superset" \
           org.opencontainers.image.description="A docker image contains Apache Superset with dependencies based on CentOS 7 Linux." \
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
#ENV        PKG_BASE_DEPS="epel-release \
#                          gcc gcc-c++ \
#                          python36-devel \
#                          mariadb-devel \
#                          libffi-devel \
#                          openssl-devel \
#                          libsasl2-devel \
#                          openldap-devel"
# ----------------------------------------------
#ENV        PKG_SUPERSET_DEPS="superset mysqlclient psycopg2 pyhive"
#ENV        PIP_MIRROR_URL="https://mirrors.aliyun.com/pypi/simple/"
# ================================================================
# 1. Setting TimeZone(UTC+8)
# 2. Install OS level packages
# 4. Install `apache-superset` with dependencies
# 3. Clean caches
# ================================================================
RUN        PKG_BASE_DEPS="epel-release \
                          gcc gcc-c++ \
                          python36-devel \
                          mariadb-devel \
                          libffi-devel \
                          openssl-devel \
                          libsasl2-devel \
                          openldap-devel" && \
           PKG_SUPERSET_DEPS="superset mysqlclient psycopg2 pyhive" && \
           PIP_MIRROR_URL="https://mirrors.aliyun.com/pypi/simple/" && \
           cp "/usr/share/zoneinfo/Asia/Shanghai" "/etc/localtime" && \
           echo "Asia/Shanghai" > "/etc/timezone" && \
           yum -y install "epel-release" && \
           yum -y install ${PKG_BASE_DEPS} && \
           python36 -m venv "/root/superset_py3/" && cd "/root/superset_py3/" && \
           source bin/activate && \
           pip install ${PKG_SUPERSET_DEPS} -i ${PIP_MIRROR_URL} --no-cache-dir && \
           deactivate && \
           yum clean all
# ===============================
# - 8088 -> Superset Webserver
# ===============================
#EXPOSE 8088
# ===============================
#WORKDIR    /root/
# ===============================
# EOF

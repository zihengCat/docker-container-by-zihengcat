# -------------------------------
#  Dockerfile - Odoo
#  Author: zihengCat
#  Version: 1.0.0
# -------------------------------
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
LABEL      org.opencontainers.image.title="DockerImage - Odoo" \
           org.opencontainers.image.description="A docker image contains odoo build from source based on CentOS 7 Linux." \
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
# =========================================================
# 1. Setting TimeZone(UTC+8)
# 2. Install Python, Node.JS, GCC...
# 3. Download `odoo_11.tar.gz` source tarball
# 3. Clean caches
# =========================================================
RUN        PKG_BASE_DEPS="epel-release \
                          python36-devel \
                          nodejs-devel \
                          gcc gcc-c++ make git \
                          libxml2-devel \
                          libxslt-devel \
                          openldap-devel \
                          postgresql*" && \
           ODOO_11_PKG="https://nightly.odoocdn.com/11.0/nightly/src/odoo_11.0.latest.tar.gz" && \
           cp "/usr/share/zoneinfo/Asia/Shanghai" "/etc/localtime" && \
           echo "Asia/Shanghai" > "/etc/timezone" && \
           yum -y install "epel-release" && \
           yum -y install ${PKG_BASE_DEPS} && \
           cd "/root/" && curl -O ${ODOO_11_PKG} && \
           yum clean all && \
           useradd "odoo"
# ===============================
# - 8069 -> Odoo
# - 5432 -> PostgreSQL
# ===============================
#EXPOSE 8069
#EXPOSE 5432
# ===============================
#USER       odoo
#WORKDIR    /home/odoo/
# ===============================
# EOF

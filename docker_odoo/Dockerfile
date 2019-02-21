# --------------------------------
#  Dockerfile - Odoo 11
#  Author: zihengCat
#  Version: 1.0.0
# --------------------------------
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
LABEL      org.opencontainers.image.title="DockerImage - Odoo11" \
           org.opencontainers.image.description="A docker image contains Odoo11 build from source based on CentOS 7 Linux." \
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
# =============================================================
# 1. Setting TimeZone(UTC+8)
# 2. Install PostgreSQL 10.6 from PostgreSQL Offical `yum` repo
# 2. Install Python, Node.JS, GCC...
# 3. Download `odoo_11.tar.gz` source tarball
# 3. Clean caches
# -------------------------------------------------
# ** Old PostgreSQL 9.2.24 Versions (deprecated) **
# -------------------------------------------------
# - postgresql*
# =============================================================
RUN        PKG_BASE_DEPS="epel-release \
                          python36-devel \
                          nodejs-devel \
                          gcc gcc-c++ make git \
                          libxml2-devel \
                          libxslt-devel \
                          openldap-devel \
                          Wkhtmltopdf-devel" && \
           ODOO_11_PKG="https://nightly.odoocdn.com/11.0/nightly/src/odoo_11.0.latest.tar.gz" && \
           PGSQL_10_REPO="https://download.postgresql.org/pub/repos/yum/10/redhat/rhel-7-x86_64/pgdg-centos10-10-2.noarch.rpm" && \
           PGSQL_10_PKGS="postgresql10*" && \
           NPM_MIRROR_URL="https://registry.npm.taobao.org/" && \
           cp "/usr/share/zoneinfo/Asia/Shanghai" "/etc/localtime" && \
           echo "Asia/Shanghai" > "/etc/timezone" && \
           yum -y install "epel-release" && \
           yum -y install ${PGSQL_10_REPO} && \
           yum -y install ${PGSQL_10_PKGS} && \
           yum -y install ${PKG_BASE_DEPS} && \
           npm --registry ${NPM_MIRROR_URL} \
                 install -g "less" && \
           git clone "https://github.com/odoo/odoo.git" -b 11.0 --depth=1 && \
           npm cache clean && \
           yum clean all && \
           cd "/root/" && curl -O ${ODOO_11_PKG} && \
           useradd "odoo" && su "odoo" && \
           cd && \
           python36 -m venv "odoo_11_py3"
# -------------------------------
#COPY       odoo.conf /etc/
# ===============================
# - 8069 -> Odoo Service
# - 5432 -> PostgreSQL
# ===============================
#EXPOSE 8069
#EXPOSE 5432
# ===============================
#USER       odoo
#WORKDIR    /home/odoo/
# ===============================
# EOF

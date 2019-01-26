# --------------------
#  Dockerfile - Redash
#  Author: zihengCat
#  Version: 1.0.0
# --------------------
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
LABEL      org.opencontainers.image.title="DockerImage - Redash" \
           org.opencontainers.image.description="A docker image contains Redash with dependencies based on CentOS 7 Linux." \
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
#ENV        PIP_MIRROR_URL="https://mirrors.aliyun.com/pypi/simple/"
# ================================================================
# 1. Setting TimeZone(UTC+8)
# 2. Install OS level libraries
# 4. Install `redash` with dependencies
# 3. Clean caches
# ================================================================
RUN        PKG_BASE_DEPS="epel-release \
                          net-tools \
                          gcc gcc-c++ \
                          python-devel \
                          python-virtualenv \
                          nodejs-devel \
                          mariadb-devel \
                          freetds-devel \
                          cyrus-sasl-devel" && \
           PIP_REDASH_DEPS="numpy" && \
           PKG_SOURCE_URL="https://github.com/getredash/redash/archive/v6.0.0.tar.gz" && \
           PIP_MIRROR_URL="https://mirrors.aliyun.com/pypi/simple/" && \
           NPM_MIRROR_URL="https://registry.npm.taobao.org/" && \
           cp "/usr/share/zoneinfo/Asia/Shanghai" "/etc/localtime" && \
           echo "Asia/Shanghai" > "/etc/timezone" && \
           yum -y install "epel-release" && \
           yum -y install ${PKG_BASE_DEPS} && \
               gcc --version && \
               g++ --version && \
               python --version && \
               virtualenv --version && \
               node --version && \
               npm --version && \
           virtualenv "/root/redash" && cd "/root/redash" && \
           source bin/activate && \
           curl -o "redash_6.0.0.tar.gz" ${PKG_SOURCE_URL} && \
           tar -xvz -f "redash_6.0.0.tar.gz" && cd "redash-6.0.0" && \
           pip install ${PIP_REDASH_DEPS} -i ${PIP_MIRROR_URL} --no-cache-dir && \
           pip install -r requirements.txt -r requirements_dev.txt \
                       -i ${PIP_MIRROR_URL} \
                       --no-cache-dir && \
           npm install --registry ${NPM_MIRROR_URL} && \
           npm run build && \
           deactivate && \
           npm cache clean && \
           yum clean all
# ===============================
# 5432 -> PostgreSQL
# 6379 -> Redis
# ===============================
# 8080 -> Webpack Server
# 5000 -> Flask Web Server
# ===============================
#EXPOSE     5432
#EXPOSE     6379
#EXPOSE     8080
#EXPOSE     5000
# ===============================
#WORKDIR    /root/
# ===============================
# EOF

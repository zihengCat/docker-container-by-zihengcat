# -------------------------------
#  Dockerfile - MariaDB(CentOS-7)
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
LABEL      org.opencontainers.image.title="DockerImage - MariaDB(CentOS7)" \
           org.opencontainers.image.description="A docker image contains MariaDB based on CentOS 7 Linux." \
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
# ----------------------------------
#ENV        PKG_BASE_DEPS="mariadb \
#                          mariadb-devel \
#                          mariadb-server"
# =========================================================
# 1. Setting TimeZone(UTC+8)
# 2. Install MariaDB 5.5.60
# 3. Clean Caches
# =========================================================
RUN        PKG_BASE_DEPS="mariadb \
                          mariadb-devel \
                          mariadb-server" && \
           cp "/usr/share/zoneinfo/Asia/Shanghai" "/etc/localtime" && \
           echo "Asia/Shanghai" > "/etc/timezone" && \
           yum -y install ${PKG_BASE_DEPS} && \
           yum clean all
# ===============================
WORKDIR    /root/
# ===============================
# EOF

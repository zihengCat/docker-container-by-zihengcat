# ------------------------
#  Dockerfile - Fluent Bit
#  Author: zihengCat
#  Version: 1.0.0
# ------------------------
# ==============================
# Using Base OS -> CentOS Latest
# ==============================
FROM       docker.io/centos:latest
# ==========================
# MAINTAINER is `deprecated`
# ==========================
#MAINTAINER zihengCat
# =============================================
# LABEL following the standard set of labels by
# The Open Containers Initiative (OCI)
# =============================================
LABEL      org.opencontainers.image.title="DockerImage - Fluent Bit" \
           org.opencontainers.image.description="A docker image contains Fluent Bit with dependencies based on CentOS Linux." \
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
# 2. Install GCC, Make, CMake
# 4. Build and Install `fluent-bit-1.4.5`
# 3. Clean Caches
# ================================================================
RUN         PKG_BASE_DEPS="gcc \
                           gcc-c++ \
                           make \
                           cmake" \
            && FLUENT_BIT_PKG_URL="https://fluentbit.io/releases/1.4/fluent-bit-1.4.5.tar.gz" \
            && FLUENT_BIT_PKG_PATH="/root/fluent-bit-1.4.5.tar.gz" \
            && FLUENT_BIT_PKG_ROOT="/root/fluent-bit-1.4.5" \
            && cp "/usr/share/zoneinfo/Asia/Shanghai" "/etc/localtime" \
            && echo "Asia/Shanghai" > "/etc/timezone" \
            && yum -y install ${PKG_BASE_DEPS} \
            && curl -o ${FLUENT_BIT_PKG_PATH} ${FLUENT_BIT_PKG_URL} \
            && cd "/root" \
            && tar -xvz -f ${FLUENT_BIT_PKG_PATH} \
            && cd ${FLUENT_BIT_PKG_ROOT} \
            && cd "build/" \
            && cmake "../" \
            && make \
            && make install \
            && cd "/" \
            && rm -rf ${FLUENT_BIT_PKG_PATH} ${FLUENT_BIT_PKG_ROOT} \
            && yum -y autoremove ${PKG_BASE_DEPS} \
            && yum clean all
# ===============================
#EXPOSE 8080
#EXPOSE 8793
#EXPOSE 5555
# ===============================
#WORKDIR    /root/
# ===============================
# EOF

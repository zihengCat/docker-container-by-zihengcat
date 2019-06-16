# --------------------------
#  Dockerfile - Python 3.6.8
#  Author: zihengCat
#  Version: 1.0.0
# --------------------------
# ================================
# Using Base OS -> CentOS 7 Latest
# ================================
FROM        docker.io/centos:latest
# ==========================
# MAINTAINER is `deprecated`
# ==========================
#MAINTAINER zihengCat
# =============================================
# LABEL following the standard set of labels by
# The Open Containers Initiative (OCI)
# =============================================
LABEL       org.opencontainers.image.title="DockerImage - Python 3.6.8" \
            org.opencontainers.image.description="A docker image contains latest compiled Python3 based on CentOS 7 Linux." \
            org.opencontainers.image.authors="zihengCat" \
            org.opencontainers.image.version="1.0.0" \
            org.opencontainers.image.licenses="MIT" \
            org.opencontainers.image.url="https://github.com/zihengCat/docker-container-by-zihengcat"
# ==========================================================
# # Step 1. Setting TimeZone(UTC+8)
# # Step 2. Install system level Python3 dependent libraries
# # Step 3. Using stable released Python3 package
# > https://www.python.org/
# # Step 4. Compile Python3
# # Step 5. Install Python3
# # Step 6. Clean caches
# ==========================================================
RUN         PKG_BASE_DEPS="gcc \
                           make \
                           zlib-devel \
                           bzip2-devel \
                           xz-devel \
                           uuid-devel \
                           openssl-devel \
                           readline-devel \
                           ncurses-devel \
                           sqlite-devel \
                           libffi-devel \
                           gdbm-devel" && \
            PYTHON_PKG_PATH="/root/Python-3.6.8.tgz" && \
            PYTHON_PKG_ROOT="/root/Python-3.6.8/" && \
            PYTHIN_PKG_INSTALLED="/opt/python_3.6.8/" && \
            PYTHON_PKG_URL="https://www.python.org/ftp/python/3.6.8/Python-3.6.8.tgz" && \
            cp "/usr/share/zoneinfo/Asia/Shanghai" "/etc/localtime" && \
            echo "Asia/Shanghai" > "/etc/timezone" && \
            yum -y install ${PKG_BASE_DEPS} && \
            curl -o ${PYTHON_PKG_PATH} ${PYTHON_PKG_URL} && \
            cd "/root/" && \
            tar -xvz -f ${PYTHON_PKG_PATH} && \
            cd ${PYTHON_PKG_ROOT} && \
            mkdir ${PYTHIN_PKG_INSTALLED} && \
            ./configure \
                --prefix=${PYTHIN_PKG_INSTALLED} \
                --enable-optimizations && \
            make && \
            make install && \
            rm -rf ${PYTHON_PKG_ROOT} ${PYTHON_PKG_PATH} && \
            yum -y autoremove ${PKG_BASE_DEPS} && \
            yum clean all
# ======================================
#WORKDIR     /root/
# ======================================
# Using a Docker `entrypoint.sh`
# ======================================
#COPY        ./entrypoint.sh /root/
# ======================================
#ENTRYPOINT  ["sh", "/root/entrypoint.sh"]
# ======================================
# EOF

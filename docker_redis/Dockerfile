# -------------------------
#  Dockerfile - Redis 5.0.5
#  Author: zihengCat
#  Version: 1.0.0
# -------------------------
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
LABEL      org.opencontainers.image.title="DockerImage - Redis" \
           org.opencontainers.image.description="A docker image contains latest compiled Redis based on CentOS 7 Linux." \
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
# ==============================================================
# # Step 1. Setting TimeZone(UTC+8)
# # Step 2. Install system level Redis dependent libraries
# > Do not need `jemalloc-devel` because it is
# > built-in after Redis 5.0.5
# # Step 3. Using latest stable release Redis package
# > https://redis.io/
# # Step 4. Compile Redis
# # Step 5. Install Redis
# > Do not need `cp -r ${REDIS_PKG_ROOT} ${REDIS_PKG_INSTALLED}`
# > use `make PREFIX=${REDIS_PKG_INSTALLED} install`
# # Step 6. Clean caches
# ==============================================================
RUN        PKG_BASE_DEPS="epel-release \
                          make \
                          gcc \
                          gcc-c++" && \
           REDIS_PKG_PATH="/root/redis-5.0.5.tar.gz" && \
           REDIS_PKG_ROOT="/root/redis-5.0.5/" && \
           REDIS_PKG_INSTALLED="/opt/redis_5.0.5/" && \
           REDIS_PKG_URL="http://download.redis.io/releases/redis-5.0.5.tar.gz" && \
           cp "/usr/share/zoneinfo/Asia/Shanghai" "/etc/localtime" && \
           echo "Asia/Shanghai" > "/etc/timezone" && \
           yum -y install "epel-release" && \
           yum -y install ${PKG_BASE_DEPS} && \
           curl -o ${REDIS_PKG_PATH} ${REDIS_PKG_URL} && \
           cd "/root/" && \
           tar -xvz -f ${REDIS_PKG_PATH} && \
           cd ${REDIS_PKG_ROOT} && \
           make V=1 && \
           make PREFIX=${REDIS_PKG_INSTALLED} install && \
           rm -rf ${REDIS_PKG_ROOT} ${REDIS_PKG_PATH} && \
           yum -y autoremove ${PKG_BASE_DEPS} && \
           yum clean all
# ======================================
#WORKDIR    /root/
# ======================================
# Using a Docker `entrypoint.sh`
# ======================================
COPY ./entrypoint.sh /root/
# ======================================
ENTRYPOINT ["sh", "/root/entrypoint.sh"]
# ======================================
# EOF

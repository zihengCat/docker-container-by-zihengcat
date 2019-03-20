# ---------------------
#  Dockerfile - Cerebro
#  Author: zihengCat
#  Version: 1.0.0
# ---------------------
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
LABEL      org.opencontainers.image.title="DockerImage - Cerebro" \
           org.opencontainers.image.description="A docker image contains Cerebro with dependencies based on CentOS 7 Linux." \
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
# ================================================
# 1. Setting TimeZone(UTC+8)
# 2. Install OpenJDK 11 and System Level Libraries
# 3. Download Cerebro
# 4. Copy Cerebro Configurations to Container
# ================================================
RUN        PKG_BASE_DEPS="java-11-openjdk-devel \
                          wget" && \
           PKG_MIRROR_URL="https://github.com/lmenezes/cerebro/releases/download/v0.8.1/cerebro-0.8.1.tgz" && \
           PKG_NAME="cerebro-0.8.1.tgz" && \
           cp "/usr/share/zoneinfo/Asia/Shanghai" "/etc/localtime" && \
           echo "Asia/Shanghai" > "/etc/timezone" && \
           yum -y install ${PKG_BASE_DEPS} && \
           cd /root && \
           wget ${PKG_MIRROR_URL} && \
           tar -xvz -f ${PKG_NAME} && \
           chown -R root:root ./cerebro-0.8.1 && \
           rm -rf ${PKG_NAME} && \
           yum clean all
# ----------------------------------
#COPY       ${CEREBRO_CONFIG} /root/
# ==================================
#WORKDIR    /root/
#USER       cerebro
#EXPOSE     9900
#CMD        ["java", "-Duser.dir=/root/cerebro-0.8.1", "-Dconfig.file=/root/cerebro.conf", "-Dhttp.port=9900", "-Dhttp.address=0.0.0.0", "-cp", "-jar", "/root/cerebro-0.8.1/lib/cerebro.cerebro-0.8.1-launcher.jar"]
# ==================================
# EOF

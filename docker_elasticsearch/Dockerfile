# ----------------------------
#  Dockerfile - ElasticSearch
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
LABEL      org.opencontainers.image.title="DockerImage - ElasticSearch" \
           org.opencontainers.image.description="A docker image contains ElasticSearch with dependents based on CentOS 7 Linux." \
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
#ENV        PKG_BASE_DEPS="java-11-openjdk-devel"
#ENV        PKG_MIRROR_URL="https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.5.4.tar.gz"
# =========================================================
# 1. Setting TimeZone (UTC+8)
# 2. Install Java 11 (OpenJDK 11)
# 3. Download `elasticsearch-x.y.z.tar.gz` to the container
# 4. Add user `elastic`
# 5. Clean caches
# =========================================================
RUN        PKG_BASE_DEPS="java-11-openjdk-devel" && \
           PKG_MIRROR_URL="https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.5.4.tar.gz" && \
           cp "/usr/share/zoneinfo/Asia/Shanghai" "/etc/localtime" && \
           echo "Asia/Shanghai" > "/etc/timezone" && \
           yum -y install ${PKG_BASE_DEPS} && \
           useradd "elastic" && \
           curl -o "/home/elastic/elasticsearch-6.5.4.tar.gz" ${PKG_MIRROR_URL} && \
           yum clean all
# ===============================
#EXPOSE 9200
#EXPOSE 9300
# ===============================
#USER       elastic
#WORKDIR    /home/elastic/
#WORKDIR    /root/
# ===============================
# EOF

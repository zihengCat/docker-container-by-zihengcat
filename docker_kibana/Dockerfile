# --------------------------
#  Dockerfile - Kibana
#  Author: zihengCat
#  Version: 1.0.0
# --------------------------
# ===========================
# Using Base OS CentOS Latest
# ===========================
FROM       docker.io/centos:latest
# =============================
LABEL      org.opencontainers.image.title="DockerImage - Kibana" \
           org.opencontainers.image.description="A docker image contains Kibana with dependents based on CentOS Linux." \
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
# =================================================
# 1. Install Java 11 (OpenJDK 11)
# 2. Download ElasticSearch `*.tar.gz` to Container
# =================================================
RUN        PKG_MIRROR_URL="https://artifacts.elastic.co/downloads/kibana/kibana-7.7.1-linux-x86_64.tar.gz" \
           && cp "/usr/share/zoneinfo/Asia/Shanghai" "/etc/localtime" \
           && echo "Asia/Shanghai" > /etc/timezone \
           && useradd "elastic" \
           && curl -o "/home/elastic/kibana-7.7.1.tar.gz" ${PKG_MIRROR_URL}
# ===============================
USER       elastic
WORKDIR    /home/elastic/
# ===============================
# EOF

# ------------------
#  Dockerfile - Hue
#  Author: zihengCat
#  Version: 1.0.0
# ------------------
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
LABEL      org.opencontainers.image.title="DockerImage - Hue" \
           org.opencontainers.image.description="A docker image contains Hue with dependencies based on CentOS 7 Linux." \
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
# ================================================================
# 1. Setting TimeZone(UTC+8)
# 2. Install OS-Level Libraries, Python 2.7.5, Java 8, Maven 3.6.0
# 3. Build `Hue` from source
# 4. Clean caches
# ================================================================
RUN        PKG_BASE_DEPS="ant asciidoc \
                          make git gcc gcc-c++ \
                          cyrus-sasl-devel cyrus-sasl-gssapi cyrus-sasl-plain \
                          krb5-devel libffi-devel libxml2-devel libxslt-devel \
                          mysql mysql-devel openldap-devel python-devel \
                          libyaml-devel sqlite-devel gmp-devel openssl-devel \
                          jtidy" && \
           APACHE_MAVEN_PKG="http://mirrors.shu.edu.cn/apache/maven/maven-3/3.6.0/binaries/apache-maven-3.6.0-bin.tar.gz" && \
           CLOUDERA_HUE_PKG="https://codeload.github.com/cloudera/hue/tar.gz/release-4.3.0" && \
           cp "/usr/share/zoneinfo/Asia/Shanghai" "/etc/localtime" && \
           echo "Asia/Shanghai" > "/etc/timezone" && \
           yum -y install ${PKG_BASE_DEPS} && \
           echo "export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.191.b12-1.el7_6.x86_64" \
           >> "/root/.bash_profile" && \
           useradd "hue" && \
           cd "/root" && \
           curl -o "maven_3.6.0.tar.gz" ${APACHE_MAVEN_PKG} && \
           curl -o "hue_4.3.0.tar.gz"   ${CLOUDERA_HUE_PKG} && \
           yum clean all
# ===============================
# - 8000 -> Hue webserver
# ===============================
#EXPOSE 8000
# ===============================
#WORKDIR    /root
#USER       hue
# ===============================
# EOF

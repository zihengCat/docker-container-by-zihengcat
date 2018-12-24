# ---------------------
#  Dockerfile - Jenkins
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
LABEL      maintainer "zihengCat"
# ==================================
# Environment Variables Substitution
# ==================================
ENV        LANG     en_US.UTF-8
ENV        LANGUAGE en_US.UTF-8
ENV        LC_ALL   en_US.UTF-8
# ----------------------------------
ENV        PKG_BASE_DEPS="java-1.8.0-openjdk-devel \
                          openssh-clients \
                          sshpass \
                          git"
# ----------------------------------
ENV        PKG_MIRROR_URL="http://mirrors.shu.edu.cn/jenkins/war-stable/2.138.4/jenkins.war"
#ENV        JENKINS_CONFIG="jenkins_config"
# ===============================================
# 1. Setting TimeZone(UTC+8)
# 2. Install OpenJDK and System Level Libraries
# 3. Download Jenkins Binary `*.war` to Container
# 4. Copy Jenkins Configurations to Container
# ===============================================
RUN        cp "/usr/share/zoneinfo/Asia/Shanghai" "/etc/localtime" && \
           echo "Asia/Shanghai" > "/etc/timezone" && \
           yum -y install ${PKG_BASE_DEPS} && \
           curl -o "/root/jenkins.war" ${PKG_MIRROR_URL} && \
           yum clean all
# ----------------------------------
#COPY       ${JENKINS_CONFIG} /root/.jenkins
# ===============================
WORKDIR    /root/
# ===============================
# EOF

# ---------------------------
#  Dockerfile - Apache Hadoop
#  Author: zihengCat
#  Version: 1.0.0
# ---------------------------
# =============================
# Using Base OS CentOS 7 Latest
# =============================
FROM       docker.io/centos:latest
# ==========================
# MAINTAINER is `deprecated`
# ==========================
#MAINTAINER zihengCat
#LABEL      maintainer "zihengCat"
# ==================================
# Environment Variables Substitution
# ==================================
#ENV        LANG     en_US.UTF-8
#ENV        LANGUAGE en_US.UTF-8
#ENV        LC_ALL   en_US.UTF-8
# ----------------------------------
#ENV        PKG_BASE_DEPS="java-1.8.0-openjdk-devel \
#                          which \
#                          rsync \
#                          openssh \
#                          openssh-clients \
#                          openssh-server"
# ----------------------------------
#ENV        PKG_MIRROR_URL="http://mirrors.tuna.tsinghua.edu.cn/apache/hadoop/common/hadoop-2.9.2/hadoop-2.9.2.tar.gz"
#ENV        HADOOP_CONFIG="hadoop_config"
# ==============================================
# 1. Setting TimeZone(UTC+8)
# 2. Install OpenJDK 1.8.0 and SSH Tools
# 3. Add Executor User `hadoop`
# 4. Download `Hadoop-X.Y.Z.tar.gz` to Container
# 5. Copy Hadoop Configurations to Container
# ==============================================
RUN        PKG_BASE_DEPS="java-1.8.0-openjdk-devel \
                          which \
                          rsync \
                          openssh \
                          openssh-clients \
                          openssh-server
                          net-tools" && \
           HADOOP_MIRROR_URL="http://mirrors.tuna.tsinghua.edu.cn/apache/hadoop/common/hadoop-2.9.2/hadoop-2.9.2.tar.gz" && \
           cp "/usr/share/zoneinfo/Asia/Shanghai" "/etc/localtime" && \
           echo "Asia/Shanghai" > /etc/timezone && \
           yum -y install ${PKG_BASE_DEPS} && \
           useradd "hadoop" && \
           curl -o "/home/hadoop/hadoop-2.9.2.tar.gz" ${HADOOP_MIRROR_URL} && \
           yum clean all
# ----------------------------------
#COPY       ${HADOOP_CONFIG} /root/
# ===============================
#EXPOSE     ...
#WORKDIR    /root/
# ===============================
# EOF

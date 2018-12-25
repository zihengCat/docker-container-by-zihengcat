# -------------------------------
#  Dockerfile - Nginx
#  Author: zihengCat
#  Version: 1.0.0
# -------------------------------
# =============================
# Using Base OS CentOS 7 Latest
# =============================
FROM       docker.io/centos:latest
# ==========================
# MAINTAINER is `deprecated`
# ==========================
#MAINTAINER zihengCat
LABEL      maintainer "zihengCat"
# ==================================
# Environment Variables Substitution
# ==================================
#ENV        LANG     en_US.UTF-8
#ENV        LANGUAGE en_US.UTF-8
#ENV        LC_ALL   en_US.UTF-8
# ----------------------------------
#ENV        PKG_BASE_DEPS="gcc make \
#                          pcre pcre-devel \
#                          zlib zlib-devel \
#                          openssl openssl-devel \
#                          libxslt libxslt-devel \
#                          GeoIP GeoIP-devel \
#                          gd gd-devel \
#                          perl perl-devel perl-ExtUtils-Embed \
#                          libatomic_ops-devel"
# ----------------------------------
#ENV        NGINX_PKG_PREFIX="/opt/nginx-1.14.2"
#ENV        NGINX_PKG_ROOT="/root/nginx-1.14.2"
#ENV        NGINX_PKG_PATH="/root/nginx-1.14.2.tar.gz"
#ENV        NGINX_PKG_URL="http://nginx.org/download/nginx-1.14.2.tar.gz"
# =========================================================
# 1. Setting TimeZone(UTC+8)
# 2. Install System Level Packages
# 3. Download `nginx-X.Y.Z.tar.gz` to Container
# 3. Clean Caches
# =========================================================
RUN        PKG_BASE_DEPS="gcc make \
                          pcre pcre-devel \
                          zlib zlib-devel \
                          openssl openssl-devel \
                          libxslt libxslt-devel \
                          GeoIP GeoIP-devel \
                          gd gd-devel \
                          perl perl-devel perl-ExtUtils-Embed \
                          libatomic_ops-devel" && \
           NGINX_PKG_PREFIX="/opt/nginx-1.14.2" && \
           NGINX_PKG_ROOT="/root/nginx-1.14.2" && \
           NGINX_PKG_PATH="/root/nginx-1.14.2.tar.gz" && \
           NGINX_PKG_URL="http://nginx.org/download/nginx-1.14.2.tar.gz" && \
           cp "/usr/share/zoneinfo/Asia/Shanghai" "/etc/localtime" && \
           echo "Asia/Shanghai" > /etc/timezone && \
           yum -y install ${PKG_BASE_DEPS} && \
           curl -o ${NGINX_PKG_PATH} ${NGINX_PKG_URL} && \
           cd "/root/" && \
           tar -xvz -f ${NGINX_PKG_PATH} && \
           mkdir ${NGINX_PKG_PREFIX} && \
           cd ${NGINX_PKG_ROOT} && \
           sh configure --prefix=${NGINX_PKG_PREFIX} \
                        --with-select_module \
                        --with-poll_module \
                        --with-threads \
                        --with-file-aio \
                        --with-libatomic \
                        --with-compat \
                        --with-http_ssl_module \
                        --with-http_v2_module \
                        --with-http_realip_module \
                        --with-http_addition_module \
                        --with-http_xslt_module \
                        --with-http_image_filter_module \
                        --with-http_geoip_module \
                        --with-http_sub_module \
                        --with-http_dav_module \
                        --with-http_flv_module \
                        --with-http_mp4_module \
                        --with-http_gunzip_module \
                        --with-http_gzip_static_module \
                        --with-http_auth_request_module \
                        --with-http_random_index_module \
                        --with-http_secure_link_module \
                        --with-http_degradation_module \
                        --with-http_slice_module \
                        --with-http_stub_status_module \
                        --with-http_perl_module \
                        --with-pcre \
                        --with-pcre-jit \
                        --with-mail \
                        --with-mail_ssl_module \
                        --with-stream \
                        --with-stream_ssl_module \
                        --with-stream_realip_module \
                        --with-stream_geoip_module \
                        --with-stream_ssl_preread_module \
                        --with-cc-opt='-O3 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector --param=ssp-buffer-size=4 -m64 -mtune=generic' && \
           make && make install && \
           yum clean all
# ===============================
WORKDIR    /root/
# ===============================
# EOF

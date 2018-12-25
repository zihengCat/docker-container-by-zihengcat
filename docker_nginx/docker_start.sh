sudo docker run -d -i -t \
                --env LC_ALL=en_US.UTF-8 \
                --name nginx \
                -p 0.0.0.0:80:80 \
                ziheng/centos:nginx /usr/sbin/init

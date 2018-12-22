sudo docker run -d -i -t \
                --env LC_ALL=en_US.UTF-8 \
                --name mariadb \
                -p 0.0.0.0:3306:3306 \
                ziheng/centos:mariadb /usr/sbin/init

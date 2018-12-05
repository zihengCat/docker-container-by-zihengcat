sudo docker run -d -i -t \
                --env LC_ALL=en_US.UTF-8 \
                --name redis_commander \
                -p 0.0.0.0:8081:8081 \
                ziheng/centos:redis_commander /usr/sbin/init

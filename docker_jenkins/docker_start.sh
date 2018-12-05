sudo docker run -d -i -t \
                --env LC_ALL=en_US.UTF-8 \
                --name jenkins \
                -p 0.0.0.0:8080:8080 \
                ziheng/centos:jenkins /usr/sbin/init

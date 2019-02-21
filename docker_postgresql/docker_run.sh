sudo docker run -d -i -t \
                --env LC_ALL=en_US.UTF-8 \
                --name postgres \
                -p 0.0.0.0:5432:5432 \
                ziheng/centos:postgresql \
                /usr/sbin/init

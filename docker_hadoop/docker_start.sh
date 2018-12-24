sudo docker run -d -i -t \
                --env LC_ALL=en_US.UTF-8 \
                --name hadoop \
                -p 0.0.0.0:50070:50070 \
                -p 0.0.0.0:8088:8088 \
                -p 0.0.0.0:19888:19888 \
                ziheng/centos:hadoop /usr/sbin/init

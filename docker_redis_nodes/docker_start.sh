sudo docker run -d -i -t \
                --env LC_ALL=en_US.UTF-8 \
                --name redis_node \
                -p 0.0.0.0:6379:6379 \
                ziheng/centos:redis_nodes /usr/sbin/init

sudo docker run -d -i -t \
                --env LC_ALL=en_US.UTF-8 \
                --name kibana \
                -p 0.0.0.0:5601:5601 \
                ziheng/centos:kibana /usr/sbin/init

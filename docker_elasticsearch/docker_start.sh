sudo docker run -d -i -t \
                --env LC_ALL=en_US.UTF-8 \
                --name elasticsearch \
                -p 0.0.0.0:9200:9200 \
                -p 0.0.0.0:9300:9300 \
                ziheng/centos:elasticsearch /usr/sbin/init

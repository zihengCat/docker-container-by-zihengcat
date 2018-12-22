sudo docker run -d -i -t \
                --env LC_ALL=en_US.UTF-8 \
                --name airflow \
                -p 0.0.0.0:8080:8080 \
                ziheng/centos:apache_airflow /usr/sbin/init

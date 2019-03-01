sudo docker run -d -i -t \
                --env LC_ALL=en_US.UTF-8 \
                --name cerebro \
                -p 0.0.0.0:9900:9900 \
                ziheng/centos:cerebro \
                /usr/sbin/init
#CMD        ["java", "-Duser.dir=/root/cerebro-0.8.1", "-Dhttp.port=9900", "-Dhttp.address=0.0.0.0", "-cp", "-jar", "/root/cerebro-0.8.1/lib/cerebro.cerebro-0.8.1-launcher.jar"]

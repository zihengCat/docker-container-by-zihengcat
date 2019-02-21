sudo docker run -d -i -t \
                --env LC_ALL=en_US.UTF-8 \
                --name odoo_dev \
                -p 0.0.0.0:8069:8069 \
                -p 0.0.0.0:5432:5432 \
                ziheng/centos:odoo \
                /usr/sbin/init

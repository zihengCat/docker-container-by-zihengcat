#!/bin/bash
# -----------------------
BIND_IP='192.168.100.203'
REDIS_NODES=('7000' '7001' '7002' '7003' '7004' '7005')
REDIS_CLI='/opt/redis_5.0.2/src/redis-cli'
REDIS_SERVER='/opt/redis_5.0.2/src/redis-server'
REDIS_PATH='/root/redis_cluster/'
# -----------------------
function launch_redis_nodes() {
    for node in ${REDIS_NODES[*]}
    do
        cd "${REDIS_PATH}${node}"    && \
        ${REDIS_SERVER} ./redis.conf && \
        echo "[INFO]: \`${REDIS_PATH}${node}\` starts successful!"
    done
}
function launch_redis_cluster() {
    ${REDIS_CLI} --cluster create \
                 ${BIND_IP}:${REDIS_NODES[0]} \
                 ${BIND_IP}:${REDIS_NODES[1]} \
                 ${BIND_IP}:${REDIS_NODES[2]} \
                 ${BIND_IP}:${REDIS_NODES[3]} \
                 ${BIND_IP}:${REDIS_NODES[4]} \
                 ${BIND_IP}:${REDIS_NODES[5]} \
                 --cluster-replicas 1
}
function delete_redis_nodes() {
    ps -eF | grep -E '700[0-5]' | grep -v grep | cut -c 9-15 | xargs kill -9
    for node in ${REDIS_NODES[*]}
    do
        cd "${REDIS_PATH}${node}" && \
        rm -rf dump.rbp appendonly.aof nodes.conf && \
        echo "[INFO]: \`${REDIS_PATH}${node}\` deletes successful!"
    done

}
function main() {
    delete_redis_nodes && \
    launch_redis_nodes && \
    launch_redis_cluster
}
main

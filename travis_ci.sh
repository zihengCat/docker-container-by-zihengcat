#!/bin/bash
# ---------
ROOT_PATH=$(pwd)
DOCKER_AUTHOR='zihengCat'
# ---------
function main() {
    for e in $(ls | grep -E 'docker.+')
    do
        cd "${ROOT_PATH}/${e}" && \
        pwd && \
        docker build -t "${DOCKER_AUTHOR}/${e}" .
    done
}
# ---------
main

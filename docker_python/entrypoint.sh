#!/bin/bash
# ---------------------------------
set -e
# ---------------------------------
PYTHON_PATH='/opt/python_3.6.8/bin'
# ---------------------------------
if [[ ${1} != "" ]]
then
    ${PYTHON_PATH}/${@}
else
    echo '[ERROR]: No such Python command...'
    exit 1
fi
# ---------------------------------
# EOF

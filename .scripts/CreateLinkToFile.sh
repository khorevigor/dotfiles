#! /bin/bash
# LOCAL_IP=`ifconfig | grep -A1 eth0 | grep -v eth0 | sed 's/^.*addr\://' | sed 's/ Bcast.*$//' | sed 's/\s*$//'`

# SHARED_DIR="${HOME}/share/"
SHARED_DIR="/proj/tas/temp/ezkhoih/"

mkdir -p ${SHARED_DIR}

for var in "$@"
do
  cp -r $var $SHARED_DIR && echo `readlink -f ${SHARED_DIR}/${var}`
done

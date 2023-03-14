#!/bin/bash

# SHARED_DIR="${HOME}/share/"
SHARED_DIR="/proj/tas/temp/$USER/"

mkdir -p ${SHARED_DIR}

for var in "$@"
do
  cp -r $var $SHARED_DIR && echo `readlink -f ${SHARED_DIR}/${var}`
done



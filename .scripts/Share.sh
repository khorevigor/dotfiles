#!/bin/bash

# SHARED_DIR="/proj/tas/temp/$USER/"
SHARED_DIR="$__sharedLocationPersonal"

mkdir -p ${SHARED_DIR}

for var in "$@"
do
  cp -r $var $SHARED_DIR && echo `readlink -f ${SHARED_DIR}/${var}`
done



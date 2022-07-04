#! /bin/bash

export lastFile=`ls -t | head -n1`

DIR_NAME=${lastFile%.*}
DIR_NAME=${DIR_NAME%.tar}
mkdir $DIR_NAME
tar -xzf $lastFile -C $DIR_NAME
cd $DIR_NAME

#! /bin/bash

DIR_NAME=${1%.*}
DIR_NAME=${DIR_NAME%.tar}
mkdir $DIR_NAME
tar -xzf $1 -C $DIR_NAME

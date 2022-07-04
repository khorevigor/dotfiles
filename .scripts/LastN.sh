#! /bin/bash

# Lists N last files in specified directory
# if N is not present, lists latest file
# if path to directory is not presents, lists in current directory

re='^[0-9]+$'
 
if [[ $2 =~ $re ]] && [ "$#" -ne 1 ]; then
  ls $1 -t | head -n$2;
  exit 0
fi
if ! [[ $1 =~ $re ]] && [ "$#" -eq 1 ]; then
  ls $1 -t | head -n1
  exit 0
fi
if [[ $1 =~ $re ]] && [ "$#" -eq 1 ]; then
  ls -t | head -n$1
  exit 0
fi
  ls -t | head -n1

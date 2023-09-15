#!/bin/bash

for var in "$@"
do 
  $__scriptsDir/ExtractArchiveIntoNewDir.sh $var
done

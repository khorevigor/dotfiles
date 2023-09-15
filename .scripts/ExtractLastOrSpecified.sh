#! /bin/bash

if [ "$#" -ne 1 ]; then
  $__scriptsDir/ExtractLastArchiveIntoNewDir.sh
  exit 0
fi
  $__scriptsDir/ExtractArchiveIntoNewDir.sh $1

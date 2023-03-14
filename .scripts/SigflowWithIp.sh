#!/bin/bash

flow ()
{

  SIGFLOW_PATH="$__projectsDir/mtas_design/tools/utils/sigflow/sigflow.sh"

  if [ "$#" -ne 1 ]; then
    $SIGFLOW_PATH -csmf *.pcap* && google-chrome *.html &
    exit 0
  fi
    $SIGFLOW_PATH -a $1 -csmf *.pcap* && google-chrome *.html &
}

flow

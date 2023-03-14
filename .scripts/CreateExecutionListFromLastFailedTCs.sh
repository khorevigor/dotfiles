#! /bin/bash

if [ "$#" -ne 1 ]; then
  ls | grep 'fail\|error' | sed 's/-.*//' | uniq > $HOME/.config/tiger2/`hostname`/config/MAIA-VMware/testcases.cfg && sed -i '1i\[EXECUTE]' $HOME/.config/tiger2/`hostname`/config/MAIA-VMware/testcases.cfg
  exit 0
fi
  ls -t | head -n$1 | grep 'fail\|error' | sed 's/-.*//' | uniq > $HOME/.config/tiger2/`hostname`/config/MAIA-VMware/testcases.cfg && sed -i '1i\[EXECUTE]' $HOME/.config/tiger2/`hostname`/config/MAIA-VMware/testcases.cfg

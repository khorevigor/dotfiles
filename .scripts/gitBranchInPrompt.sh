#!/bin/csh

setenv GIT_BRANCH_CMD "sh -c 'git branch --no-color 2> /dev/null' | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'"
set prompt="%m [%T] [%C3] ${red}`$GIT_BRANCH_CMD`${end}-%#%b "
 


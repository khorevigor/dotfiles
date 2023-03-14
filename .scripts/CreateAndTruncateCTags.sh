#!/bin/bash

$__scriptsDir/ctags_ttcn_alena.py;
sed -i "/.*\(SIP_Co\|SDP_Co\|ISC_Se\).*/d" $__projectsDir/ft/bin/.build/tags

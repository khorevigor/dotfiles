#!/usr/bin/expect -f

spawn ssh -o UserKnownHostsFile=/dev/null root@192.168.83.100
expect "*Are you sure you want to continue connecting*"
send "yes\r"
expect "assword: *"
send "rootroot\r"
interact


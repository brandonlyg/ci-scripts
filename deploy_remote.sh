#!/usr/bin/expect

set user [lindex $argv 0]
set host [lindex $argv 1]
set appsdir [lindex $argv 2]
set appname [lindex $argv 3]
set deployscript [lindex $argv 4]

set exp "\[$#\]"

spawn ssh $user@$host
expect "$exp"
send "cd $appsdir\n"
expect "$exp"
send "./$deployscript $appname\n"
expect "$exp"
send "rm -rf $deployscript\n"
expect "$exp"
send "logout\n"
interact


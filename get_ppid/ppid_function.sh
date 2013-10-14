#!/usr/bin/env bash

##
# ppid function to retrieve parent pid of given pid (current one by default)
# source this script from your bash to call the function. Inspired by:
# http://superuser.com/questions/150117/how-to-get-parent-pid-of-a-given-process-in-gnu-linux-from-command-line
##

function ppid {
    ps -p ${1:-$$} -o ppid=;
}

#!/bin/sh
selfdir=`cd $(dirname $0);pwd`

#export GIT_BRANCH="origin/release"

#export ori=$(echo $GIT_BRANCH|awk -F\/ '{ print $1 }')
#export branch=$(echo $GIT_BRANCH|awk -F\/ '{ print $2 }')

export BRANCH="master"

export appname="example-springbootmvc"

export master_user="root"
export master_appsdir="/root/vmd/apps"
export master_iplist="192.168.1.31"

export release_user="root"
export release_appsdir="/root/vmd/apps"
export release_iplist="192.168.1.33"


$selfdir/distanddeploy.sh

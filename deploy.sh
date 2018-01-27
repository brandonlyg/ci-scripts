#!/bin/sh

selfdir=`cd $(dirname $0);pwd`

appname=$1
dist=$2
destdir=$3
user=$4
iplist=$5

iplist=`echo $iplist|sed 's/,/ /g'`

deployscript=deployandstart.sh

for ip in $iplist; do
	scp $dist/${appname}.zip $user@$ip:$destdir
	scp $selfdir/$deployscript $user@$ip:$destdir/${appname}-$deployscript
	
	$selfdir/deploy_remote.sh $user $ip $destdir $appname ${appname}-$deployscript
done


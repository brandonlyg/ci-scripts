#!/bin/sh

selfdir=$(cd $(dirname $0);pwd)
cd $selfdir

appname=$1

tmpappdir="tmp@$appname"

unalias cp

if [ -d $tmpappdir ]; then
	rm -rfv $tmpappdir
fi

unzip ./$appname.zip -d ./$tmpappdir
cp -rfv ./$tmpappdir/$appname ./

rm -rfv ./$appname.zip ./$tmpappdir

$selfdir/$appname/bin/start.sh



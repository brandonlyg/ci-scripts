#!/bin/sh

selfdir=`cd $(dirname $0);pwd`

appname=$1
branch=$2
dist=$3
filelist=$4

unalias cp

rm -rf $dist

mkdir $dist

todir=$dist/$appname

sh $selfdir/copyto.sh . $todir $filelist

if [ "$?" != "0" ]; then
	exit 1
fi

cp -rfv ./multiconfig/$branch/*  ./$todir/config

cd $dist
/usr/bin/zip -r ${appname}.zip $appname


#!/bin/sh

fromdir=$1
todir=$2
filelist=$3

unalias cp

if [ ! -d $fromdir ]; then
	echo "$fromdir not exists"
	exit 1
fi

cd $fromdir

if [ ! -d $todir ]; then
	mkdir -v $todir
fi

filelist=`echo $filelist|sed 's/,/ /g'`

function copy_file(){
	file=$1
	
	haswc=`echo $file|grep "*"`
	
	if [ -n "$haswc" ]; then
		cp -rfv --parents $file $todir
		return 0
	fi

	if [ -d "$file" ]; then
		mkdir -pv "$todir/$file"
		return 0
	fi

	if [ -f "$file" ]; then
		cp -rfv --parents $file $todir
		return 0
	fi

	return 1
}


for file in $filelist ; do
	copy_file $file
	#echo $?
	if [ "$?" -ne "0" ]; then
		exit 1
	fi
done






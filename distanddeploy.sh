#!/bin/sh

selfdir=`cd $(dirname $0);pwd`

if [ "$BRANCH" = "release" ]; then
	git checkout test
	git pull origin test
	git checkout $BRANCH
	git pull origin $BRANCH
	git merge test
elif [ "$BRANCH" = "publish" ]; then
	git checkout release
	git pull origin release
else
	git checkout $BRANCH
	git pull origin $BRANCH
fi

gradle build


eval user=\$${BRANCH}_user
eval appsdir=\$${BRANCH}_appsdir
eval iplist=\$${BRANCH}_iplist

if [ "$BRANCH" = "publish" ]; then
	eval iplist=\$${BRANCH}_${DEPLOY}_iplist
fi

$selfdir/create_dist.sh $appname $BRANCH dist bin/*,config/*,build/libs/*
$selfdir/deploy.sh $appname dist $appsdir $user $iplist


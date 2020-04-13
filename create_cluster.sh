#!/bin/sh
HOSTFILE=$1
while read -u10 HOST
do
echo $HOST
ssh $HOST "mkdir -p $PWD" 2>&1 > ec2.log
scp update_cluster.sh $HOST:$PWD
ssh $HOST "bash $PWD/update_cluster.sh" 2>&1 > ec2.log
done 10< "$HOSTFILE"
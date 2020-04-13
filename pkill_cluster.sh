#!/bin/sh
HOSTFILE=$1
while read -u10 HOST
do
echo $HOST
ssh -n -f $HOST "pkill -9 python3"
done 10< "$HOSTFILE"
#!/bin/sh
HOSTFILE=$1
while read -u10 HOST
do
echo $HOST
ssh -n -f $HOST "sh -c 'cd ~; pkill -9 python; nohup python dummy.py > /dev/null 2>&1 &'"
done 10< "$HOSTFILE"
#!/bin/sh
HOSTFILE=$1
while read -u10 HOST
do
echo $HOST
ssh -n -f $HOST $2
done 10< "$HOSTFILE"
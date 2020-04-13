#!/bin/bash
if [ $# -ne 1 ]; then
    echo 'usage: ';
    echo 'bash ec2-controller.sh instance-name';
    echo "number of arguments received=$#";
    exit -1;
fi

mkdir -p ~/hosts

# horovod
aws --output text ec2 describe-instances --filters "Name=tag:Name,Values=$1" --query "Reservations[*].Instances[*].[PrivateIpAddress]" | sed 's/.*/& slots=1/' > ~/hosts/$1
# mpi, ssh, etc.
aws --output text ec2 describe-instances --filters "Name=tag:Name,Values=$1" --query "Reservations[*].Instances[*].[PrivateIpAddress]" > ~/hosts/$1-0

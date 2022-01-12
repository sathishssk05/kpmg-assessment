#!/bin/bash

# AWS Cli Auth

echo Initiating AWS-CLI Auth

aws configure

echo Fetching the EC2 Instance Metadata
echo Enter the Instance ID...!
read instance
echo Do you want to perform specific lookup for the instance...?
read lookup
if [ $lookup == yes ]
then
   echo Enter the Key Value to fetch the specific lookup...!
   read key
   aws ec2 describe-instances --instance-ids $instance  --query $key --output json
else
   aws ec2 describe-instances --instance-ids $instance  --output json
fi
# key=$KEY
# instance-id=$INSTANCE_ID
#i-031a96c0cc00a7984





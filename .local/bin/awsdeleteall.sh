#!/bin/bash

FUNC='
def olderthan(fmt; days):
    def inner:
        (now - (fmt | gsub("[.].*Z$"; "Z") | fromdateiso8601)) > (days*60*60*24);
    inner;
    
def instances:
    .Reservations[].Instances[];

def instancename:
    (.Tags // [] | .[] | select(.Key == "Name") | .Value) // "no name";

'

AWS='
instances | select(olderthan(.LaunchTime; 2)) | [instancename, .LaunchTime, .InstanceId] | join(" ")
'

DO='
    .[] | select(olderthan(.created_at; 2)) | [.name, .created_at, (.id | tostring)] | join(" ")
'

run_aws()
{
    REGIONS="$(aws ec2 describe-regions | jq -r '.Regions[].RegionName')"


    for r in $REGIONS; do
        echo REGION $r
        aws --region $r ec2 describe-instances | jq -r "${FUNC}${AWS}" | sort
    done
}

run_digitalocean()
{
    echo DIGITAL OCEAN
    doctl compute droplet ls -o json | jq -r "${FUNC}${DO}" | sort
}

run_aws
run_digitalocean

DIGITALOCEAN_ACCESS_TOKEN=$DIGITALOCEAN_ACCESS_TOKEN_QA
run_digitalocean

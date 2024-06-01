#!/bin/sh

ips=$(terraform output -json --state=../terraform.tfstate | jq -r '.[].value[]' | cut -d '/' -f1)

for ip in $ips; do
    echo $ip
    ssh-keygen -f "$HOME/.ssh/known_hosts" -R "$ip" > /dev/null 2>&1
    if scp -o 'StrictHostKeyChecking no' -o 'ConnectTimeout=3' -q scan.* rocky@$ip:/home/rocky > /dev/null 2>&1; then
         ssh rocky@$ip sh scan.sh scan.csv
    else
        echo "\e[0;41mERROR\e[0m: $ip -> no connection"
    fi
done
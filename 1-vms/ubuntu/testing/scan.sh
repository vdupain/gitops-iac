#!/bin/sh

# Port check with Netcat
# Author: Jose Vicente Nunez <@josevnz@fosstodon.org>
if [ -n "$1" ] && [ -f "$1" ]; then
  while read -r line; do
    machine=$(echo "$line"| /bin/cut -d' ' -f1)|| exit 100
    ports=$(echo "$line"| /bin/cut -d' ' -f2)|| exit 101
    OLD_IFS=$OLD_IFS
    IFS=","
    for port in $ports; do
      if  /usr/bin/nc -z -v -w 3 "$machine" "$port" > /dev/null 2>&1; then
        echo "\e[0;42mOK\e[0m: $machine -> $port"
      else
        echo "\e[0;41mERROR\e[0m: $machine -> $port"
      fi
    done
    IFS=$OLD_IFS
  done < "$1"
else
  echo "ERROR: Invalid or missing data file!"
  exit 103
fi
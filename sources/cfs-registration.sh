#!/bin/sh

serial=$(cat /proc/cpuinfo | grep Serial | cut -d":" -f2)
mac=$(cat /sys/class/net/eth0/address)

registration_service=https://coding-for-school-boards.herokuapp.com/register

if [ x$serial = x"" ]; then
  echo "CPU Serial not found. Using mac address"
  serial=$mac
fi

curl -s $registration_service/$serial > /dev/null

#result=$(curl -s $registration_service/$serial)

#print "$result"

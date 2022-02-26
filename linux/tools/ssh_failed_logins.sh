#!/bin/bash
# Modified Version of CyberLions' sshscript.sh
# Source: https://github.com/CyberLions/CCDC/blob/master/2020/Short%20Scripts/sshscript.sh


echo "running..." > /dev/tty
while :
do
  logFile=$(cat /var/log/auth.log | grep "authentication failure")
  knownFailures=$(cat ./knownFailures)
    echo "checking failures..." > /dev/tty
    output=$(diff <(echo "$logFile") <(echo "$knownFailures"))
    echo "$output" > /dev/tty
echo "saving results..." > /dev/tty
echo "$logFile" > ./knownFailures
sleep 5

done

#!/bin/bash
# Modified version of CyberLions' displayUsers script
# Original Source: https://github.com/CyberLions/CCDC/blob/master/2020/Short%20Scripts/displayUsers.sh

# Set prompt colors 
RED='\033[0;31m'
GREEN='\u001b[32m'
YELLOW='\u001b[33m'
NC='\033[0m' 

# Check UID for root.
if [ "$EUID" -ne 0 ]
  then echo -e "${RED}-Run as Root-"
  exit
fi

echo -e "${GREEN}Current users:${NC}"
command w 
echo -e "-----------"

echo -e "${YELLOW}New users:${NC}"
command grep useradd /var/log/auth.log | grep "new user" > log.txt 
tail -n 2 log.txt 
echo -e "-----------"

echo -e "${RED}Deleted users:${NC}" 
command sudo grep userdel /var/log/auth.log | grep "delete user" > log.txt 
tail -n 2  log.txt 
echo -e "-----------"

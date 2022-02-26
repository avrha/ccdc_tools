#!/bin/bash
# Set prompt colors 
RED='\033[0;31m'
GREEN='\u001b[32m'
YELLOW='\u001b[33m'
NC='\033[0m' 


# Check UID for root.
if [ "$EUID" -ne 0 ]
  then echo -e "${RED}-Run as Root-${NC}"
  exit
fi

echo -e "------------------------------------------------"
echo -e "${GREEN}Successful Logins${NC}"
echo -e "------------------------------------------------"
last -aiF > user_logins.txt
echo -e "------------------------------------------------" >> user_logins.txt
head -n 7 user_logins.txt

echo -e "------------------------------------------------"
echo -e "${RED}Failed Logins${NC}"
echo -e "------------------------------------------------"
lastb -adF >> user_logins.txt
echo -e "------------------------------------------------" >> user_logins.txt
head -n 7 user_logins.txt

echo -e "------------------------------------------------"
echo -e "${YELLOW}Last Logins of User${NC}"
echo -e "------------------------------------------------"
lastlog | grep -v Never >> user_logins.txt
echo -e "------------------------------------------------" >> user_logins.txt
head -n 7 user_logins.txt

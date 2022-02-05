#!/bin/bash

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

# TODO
# Check for and add trusted/offical ubuntu repos

# Perform system update 
echo -e "${YELLOW}-Updating Ubuntu-"
apt update
apt upgrade -y
apt -y dist-upgrade

# Clean up system
echo -e "${YELLOW}-Removing Unused/Deprecated Packages and Dependencies-${NC}"
apt clean
apt autoclean
apt autoremove

# Exit script
echo -e "${GREEN}-System Update Complete-"
exit


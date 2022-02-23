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

# Perform system update 
echo -e "${YELLOW}-Updating Ubuntu-"
apt update
apt upgrade -y

# Get Ubuntu release
x="lsb_release -d | cut -f 2"
y=$(eval"$x")

# Check if Ubuntu 14.04.06 is running
if [[ $y = "Ubuntu 14.04.6 LTS" ]]
then
  echo -e "${GREEN}-System Update Complete-"
  exit
else
  # Clean up system
  echo -e "${YELLOW}-Removing Unused/Deprecated Packages and Dependencies-${NC}"
  apt clean
  apt autoclean
  apt autoremove
  echo -e "${GREEN}-System Update Complete-"
  exit
fi

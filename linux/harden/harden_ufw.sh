#!/bin/bash

# Set prompt colors 
RED='\033[0;31m'
GREEN='\u001b[32m'
YELLOW='\u001b[33m'
NC='\033[0m'

# Check if user is root
if [ $EUID -ne 0 ]
  then echo -e "${RED}-Run as Root-${NC}"
  exit
fi

# Print out IP addresses
ifconfig 

# Prompt user for IP and network addres
echo "Enter your ip address:"
read ip_address
echo "Enter your network address:"
read net_address

# Allow connections (22,80,443,3306)
ufw limit from $net_address to any app "OpenSSH"
ufw allow "Apache Full"
ufw allow from $ip_address to any port 3306

# Default policies (Deny in, allow out)
ufw default deny incoming
ufw default allow outoing

echo -e "${GREEN}-Firewall Set-${NC}"

#!/bin/bash

# Set prompt colors 
RED='\033[0;31m'
NC='\033[0m' 

# Check UID for root.
if [ "$EUID" -ne 0 ]
  then echo -e "${RED}-Run as Root-${NC}"
  exit
fi

# Print passwords hashes for user accounts
grep -E '\$..?\$' /etc/shadow

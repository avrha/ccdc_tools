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

# Print passwords hashes for user accounts
grep -E '\$..?\$' /etc/shadow

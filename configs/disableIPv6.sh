#!/bin/bash
RED='\033[0;31m'
NC='\033[0m' 

# Check UID for root.
if [ "$EUID" -ne 0 ]
  then echo -e "${RED}-Run as Root-${NC}"
  exit
fi

echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf
sysctl -p

#!/bin/bash
#
# Author: Joey Ferenchak
# Date: 25 Feb 2022
# Description: Hardening script for Ubuntu web server.
#

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
 

# Secure mysql: https://www.linode.com/docs/guides/how-to-secure-mysql-server/
# Secure Ubuntu
./harden_ubuntu.sh

# Secure SSH
./harden_ssh.sh

# Secure Apache2
./harden_apache2.sh

# Restrict Files
./lock_down_files.sh

# STIG Compliance
touch /etc/security/pwquailty.conf
./apply_linux_stig.sh

# Secure Network
./harden_networking.sh

# Set firewall with UFW
./harden_ufw.sh

# Backup files
./backup_files.sh

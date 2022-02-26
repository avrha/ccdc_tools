#!/bin/bash

#    This file is part of blue-team
#    Copyright (C) 2017 @maldevel
#    https://github.com/maldevel/blue-team
#    
#    blue-team - Blue Team Scripts.
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#   
#    For more see the file 'LICENSE' for copying permission.



# Set /etc/ssh/sshd_config ownership and access permissions
chown root:root /etc/ssh/sshd_config
chmod 600 /etc/ssh/sshd_config

# Change Port (only if it's allowed)
#sed -i "s/#Port 22/Port 62111/g" /etc/ssh/sshd_config

# Protocol 2
echo "Protocol 2" >> /etc/ssh/sshd_config

# Set SSH LogLevel to INFO
sed -i "/LogLevel.*/s/^#//g" /etc/ssh/sshd_config

# Set SSH MaxAuthTries to 3
sed -i "s/.*MaxAuthTries.*/MaxAuthTries 3/g" /etc/ssh/sshd_config

# Enable SSH IgnoreRhosts
sed -i "s/.*IgnoreRhosts.*/IgnoreRhosts yes/g" /etc/ssh/sshd_config

# Disable Pam
sed -i "s/.*UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config

sed -i "s/.*PubkeyAuthentication.*/PubkeyAuthentication yes/g" /etc/ssh/sshd_config

# Disable SSH HostbasedAuthentication
sed -i "s/.*HostbasedAuthentication.*/HostbasedAuthentication no/g" /etc/ssh/sshd_config

# Disable SSH root login
sed -i "s/.*PermitRootLogin.*/PermitRootLogin no/g" /etc/ssh/sshd_config

# Deny Empty Passwords
sed -i "s/.*PermitEmptyPasswords.*/PermitEmptyPasswords no/g" /etc/ssh/sshd_config

# Deny Password Auth

#sed -i "s/.*PasswordAuthentication.*/PasswordAuthentication no/g" /etc/ssh/sshd_config

# Deny Users to set environment options through the SSH daemon
sed -i "/PermitUserEnvironment.*no/s/^#//g" /etc/ssh/sshd_config

# Allow only approved ciphers

if grep -w "Ciphers aes256-ctr" /etc/ssh/sshd_config;
then
    echo "Ciphers aes256-ctr exists"
else
echo "Ciphers aes256-ctr" >> /etc/ssh/sshd_config
fi

# Allow users

echo "AllowUsers sysboss" >> /etc/ssh/sshd_config

# Set MAC

if grep -w "MACs hmac-sha2-512-etm@openssh.com,hmac-sha2-256-etm@openssh.com,hmac-sha2-512,hmac-sha2-256" /etc/ssh/sshd_config;
then
    echo "MACs hmac-sha2-512-etm@openssh.com,hmac-sha2-256-etm@openssh.com,hmac-sha2-512,hmac-sha2-256 exists"
else
echo "MACs hmac-sha2-512-etm@openssh.com,hmac-sha2-256-etm@openssh.com,hmac-sha2-512,hmac-sha2-256" >> /etc/ssh/sshd_config
fi

# Disable Tunnelling 

if grep -w "AllowTcpForwarding" /etc/ssh/sshd_config;
then
    sed -i "s/.*AllowTcpForwarding.*/AllowTcpForwarding no/g" /etc/ssh/sshd_config
else
echo "AllowTcpForwarding no" >> /etc/ssh/sshd_config
fi

if grep -w "PermitTunnel" /etc/ssh/sshd_config;
then
    sed -i "s/.*PermitTunnel.*/PermitTunnel no/g" /etc/ssh/sshd_config
else
echo "PermitTunnel no" >> /etc/ssh/sshd_config
fi

if grep -w "AllowAgentForwarding" /etc/ssh/sshd_config;
then
    sed -i "s/.*AllowAgentForwarding.*/AllowAgentForwarding no/g" /etc/ssh/sshd_config
else
echo "AllowAgentForwarding no" >> /etc/ssh/sshd_config
fi

# Configure SSH Idle Timeout Interval
sed -i "s/.*ClientAliveInterval.*/ClientAliveInterval 300/g" /etc/ssh/sshd_config
sed -i "s/.*ClientAliveCountMax.*/ClientAliveCountMax 0/g" /etc/ssh/sshd_config

# Set Banner
sed -i "s/#Banner.*/Banner \/etc\/issue\.net/g" /etc/ssh/sshd_config
#echo "Welcome" > /etc/issue.net

# Allow wheel group use ssh
#echo "AllowGroups wheel" >> /etc/ssh/sshd_config

# Disable X11 forwarding
sed -i "s/X11Forwarding yes/#X11Forwarding yes/g" /etc/ssh/sshd_config

#service sshd reload
service ssh restart
#systemctl restart sshd

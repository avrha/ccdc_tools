#! /bin/bash
# Script was developed by the CCDC Team at Towson University
# Source: https://github.com/TU-CCDC-2022/TU-CCDC-2022/blob/main/Linux/harden/backup_files.sh
#

apt=`which apt`
yum=`which yum` 

mkdir -p /run/usys

cp /etc/ssh/ssh_config /run/usys/ssh_config
cp /etc/ssh/sshd_config /run/usys/sshd_config
cp /etc/passwd /run/usys/passwd
cp /etc/sudoers /run/usys/sudoers
cp ~/.bash_history /run/usys/.bash_history
cp ~/.bashrc /run/usys/.bashrc
cp /etc/skel /run/usys/skel
cp ~/.profile /run/usys/.profile
cp /etc/security/pwquality.conf /run/usys/pwquality.conf
cp /etc/login.defs /run/usys/login.defs
cp /etc/sysctl.conf /run/usys/sysctl.conf
cp /etc/default/useradd /run/usys/useradd
cp /var/spool/cron/crontabs/root /run/usys/root1crontab
cp /var/spool/cron/root /run/usys/root2crontab
cp /etc/hosts /run/usys/hosts
cp /etc/resolv.conf /run/usys/resolv.conf
cp -r /var/www/html /run/usys/html
cp /etc/named.conf /run/usys/named.conf
cp -r /var/named /run/usys/named

# Baselines
netstat -antup > /run/usys/netstatres
ss -antup > /run/usys/ssres
ps -eo command > /run/usys/psres
ps -eaf --forest > /run/usys/psresx
lsmod > /run/usys/lsmodres


# Processes

cp `which ps` /run/usys/ps
cp `which ss` /run/usys/ss
cp `which netstat` /run/usys/netstat
cp `which lsof` /run/usys/lsof
cp `which lsmod` /run/usys/lsmod
cp `which chkconfig` /run/usys/chkconfig
cp `which crontab` /run/usys/crontab
cp `which alias` /run/usys/alias
cp `which last` /run/usys/last
cp `which top` /run/usys/top
cp `which w` /run/usys/w
cp `which ls` /run/usys/ls
cp `which kill` /run/usys/kill
cp `which strings` /run/usys/strings
cp `which passwd` /run/usys/passwd
cp `which sudo` /run/usys/sudo
cp `which nologin` /run/usys/nologin
cp /bin/false /run/usys/false

# IPFS Implementation
# cd /var/tmp
# wget https://dist.ipfs.io/go-ipfs/v0.11.0/go-ipfs_v0.11.0_linux-amd64.tar.gz --no-check-certificate
# tar -xvzf go-ipfs_v0.11.0_linux-amd64.tar.gz
# cd go-ipfs
# sudo bash install.sh
# cd /run/usys
# ipfs init
# ipfs daemon &

tar -zcvf /run/kab$HOSTNAME.tar.gz /run/usys

# ipfs add /run/kab$HOSTNAME.tar.gz > /run/hash.sh

if [ -f $apt ]; then
apt install git -y
elif [ -f $yum ]; then
yum install git -y
fi

git init /run/usys
# cat /run/hash.sh

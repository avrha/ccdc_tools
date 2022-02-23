#!/bin/bash
#run as root
#print out all passwords hashes for human users
grep -E '\$..?\$' /etc/shadow

#determine what hashing algorithm was used to encode a user's password
#passwd -S user

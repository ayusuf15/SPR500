#! /bin/bash


x=$NETWORK_ID
y=$VM_IP

# lab 2 check started
echo "Lab 2 checking started at:"
date

# Connectivity check SPR500L2 vm - ping 192.168.x.80
ping -c 4 192.168.${x}.${y}

# Try to get the main index.html web from from /var/www/html/index.html
wget -O main-index.html 192.168.${x}.${y} -o wget-1.log

# check backup logfile location
echo "Checking backup logfile in /root/spr500/lab2/log-backup directory"
ssh root@192.168.${x}.${y} ls /root/spr500/lab2/log-backup

# check number of service enabled
echo "Checking list of enabled service"
ssh root@192.168.${x}.${y} "systemctl list-unit-files|grep enabled"

# get number of rpm package installed
echo "Getting the list of installed rpm package."
ssh root@192.168.${x}.${y} "rpm -qa --last"

# get the firewalld allowed service
echo "Getting the firewalld allowed services ports"
ssh root@192.168.${x}.${y} firewall-cmd --list-all

# get the mode of SELinux 
echo "Getting the operation mode of SELinux."
ssh root@192.168.${x}.${y} sestatus

# pulling the yum installation log information
echo "Getting the installation log information."
ssh root@192.168.${x}.${y} cat /var/log/yum.log

# done
echo "Lab 2 checks completed."
date
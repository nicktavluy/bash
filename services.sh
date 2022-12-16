#!/bin/bash

echo
echo "Available services: test connectivity, port check, disk space, memory, time"
echo
echo "Type service you want to check: "
read serv

if [[ $serv == "test connectivity" ]]
   then
      echo "Type remote IP-address: "
      read IP
      ping -c 4 $IP
elif [[ $serv == "port check" ]]
   then
      echo "Type IP-address: "
      read PORT_IP
      echo "Type port: "
      read PORT
      nmap $PORT_IP -p $PORT
         if [[ $PORT == "" ]]
            then
               nmap $PORT_IP
         fi
elif [[ $serv == "disk space" ]]
   then
      echo "Type disk to check (1-3): "
      read DISK
      sudo fdisk /dev/nvme0n1p$DISK -l
elif [[ $serv == "memory" ]]
   then
      echo "Do you want to see ONE time or EXTENDED?"
      read MEM
         if [[ $MEM == "ONE" ]]
            then
               free -h
         else watch free -h
         fi
elif [[ $serv == "time" ]]
   then
      echo "Choose time you need: Local, Universal, RTC, Time zone or ALL"
      read TM
         if [[ $TM == "Local" ]]
            then
		timedatectl | awk NR==1
         elif [[ $TM == "Universal" ]]
            then
		timedatectl | awk NR==2
	 elif [[ $TM == "RTC" ]]
	    then
		timedatectl | awk NR==3
	 elif [[ $TM == "Time zone" ]]
	    then
		timedatectl | awk NR==4
	 elif [[ $TM == ALL ]]
	    then
		timedatectl | awk 'NR == 1, NR == 4 {print NR,$0}'
	fi
fi
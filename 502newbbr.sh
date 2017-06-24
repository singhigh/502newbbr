#!/bin/bash
apt-get install make gcc-4.9
wget -O ./tcp_tsunami.c https://raw.githubusercontent.com/singhigh/502newbbr/master/tcp_tsunami.c
echo "obj-m:=tcp_tsunami.o" > Makefile
make -C /lib/modules/$(uname -r)/build M=`pwd` modules CC=/usr/bin/gcc-4.9
insmod tcp_tsunami.ko
sysctl -w net.ipv4.tcp_congestion_control=tsunami

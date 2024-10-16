#!/bin/bash

# lsblk inicial
lsblk 
# NAME   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
# loop0    7:0    0 63.9M  1 loop /snap/core20/2318
# loop1    7:1    0   64M  1 loop /snap/core20/2379
# loop2    7:2    0   87M  1 loop /snap/lxd/29351
# loop3    7:3    0 38.8M  1 loop /snap/snapd/21759
# sda      8:0    0   40G  0 disk 
# └─sda1   8:1    0   40G  0 part /
# sdb      8:16   0   10M  0 disk 
# sdc      8:32   0   10G  0 disk 
# sdd      8:48   0    2G  0 disk 

sudo fdisk /dev/sdc << EOF

n
p
1

+2500M
n
p
2

+2500M
n
p
3

+2500M
n
e
4

+2500M
n
l

+2400M
w
EOF

sudo fdisk -l /dev/sdc


#!/bin/bash

# remove old filesystem
sudo rm -rf rootfs
sudo rm -rf tmpfs
sudo rm -f a9rootfs.ext3

# create new filesystem
mkdir -p rootfs/{dev,etc/init.d,lib,mnt,proc,var,tmp,sys,root}
cp -raf busybox/_install/* rootfs/
cp -r /usr/arm-linux-gnueabi/lib rootfs/

# create device node
sudo mknod rootfs/dev/tty1 c 4 1
sudo mknod rootfs/dev/tty2 c 4 2
sudo mknod rootfs/dev/tty3 c 4 3
sudo mknod rootfs/dev/tty4 c 4 4
sudo mknod rootfs/dev/console c 5 1
sudo mknod rootfs/dev/null c 1 3

# build image
dd if=/dev/zero of=a9rootfs.ext3 bs=1M count=32
mkfs.ext3 a9rootfs.ext3

sudo mkdir tmpfs
sudo mount -t ext3 a9rootfs.ext3 tmpfs/ -o loop
sudo cp -r rootfs/*  tmpfs/
sudo umount tmpfs

# finish
echo "build rootfs finish"
exit 0

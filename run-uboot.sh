#!/bin/bash

qemu-system-arm \
    -M vexpress-a9 \
    -kernel u-boot/u-boot \
    -nographic \
    -m 512M \
    -net nic \
    -net tap,ifname=tap0,script=no,downscript=no

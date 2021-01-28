#!/bin/bash

# Quit: Ctrl+A, X

qemu-system-arm \
    -M vexpress-a9 \
    -m 512M \
    -kernel linux-5.4.92/arch/arm/boot/zImage \
    -dtb  linux-5.4.92/arch/arm/boot/dts/vexpress-v2p-ca9.dtb \
    -nographic \
    -append "root=/dev/mmcblk0  console=ttyAMA0" \
    -sd a9rootfs.ext3

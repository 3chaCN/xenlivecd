#! /bin/bash

apt install -y squashfs-tools
rm -f binary/live/filesystem.squashfs
mksquashfs chroot binary/live/filesystem.squashfs -e boot initrd.img vmlinuz

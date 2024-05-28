#! /bin/bash

apt install -y squashfs-tools
rm -f binary/live/filesystem.squashfs
mv binary binary.old
ln -s /mnt/binary binary
mv binary.old/* binary/
mksquashfs chroot binary/live/filesystem.squashfs -e boot initrd.img vmlinuz

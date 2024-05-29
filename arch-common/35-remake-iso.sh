#! /bin/sh
echo "nameserver 8.8.8.8" >> /etc/resolv.conf
echo "nameserver 8.8.8.8" >> chroot/etc/resolv.conf
apt update

apt install -y squashfs-tools
rm -f binary/live/filesystem.squashfs
mksquashfs chroot binary/live/filesystem.squashfs -e boot initrd.img vmlinuz

rm binary/md5sum.txt
lb binary_checksums --force
lb binary_iso --force

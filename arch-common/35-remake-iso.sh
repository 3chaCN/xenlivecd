#! /bin/sh
echo "nameserver 8.8.8.8" >> /etc/resolv.conf
echo "nameserver 8.8.8.8" >> chroot/etc/resolv.conf
apt update
rm binary/md5sum.txt
lb binary_checksums --force
lb binary_iso --force

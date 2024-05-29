#! /bin/sh
echo "nameserver 8.8.8.8 >> /etc/resolv.conf
rm binary/md5sum.txt
lb binary_checksums --force
lb binary_iso --force

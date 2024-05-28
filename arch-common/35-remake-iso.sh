#! /bin/sh

apt install xorriso isolinux -y
rm binary/md5sum.txt
lb binary_md5sum --force
lb binary_iso --force

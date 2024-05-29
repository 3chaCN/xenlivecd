#! /bin/sh
apt install isolinux xorriso -y
rm binary/md5sum.txt
lb binary_md5sum --force
lb binary_iso --force

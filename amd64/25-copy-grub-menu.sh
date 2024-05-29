#! /bin/sh

# Maybe merging some functions from update-grub to live-helper
# can be a good idea to improve this! Then live-helper will be able
# to generate grub's menu.lst for the live CD from binary/ contents... ;-)

cp -f ../stuff/grub.cfg binary/boot/grub/grub.cfg

#! /bin/sh

# This script must be run just after lh_build finishes.
# It's needed because I don't know how to tell live-helper to do this
# jobs... Maybe merging some functions from update-grub to live-helper
# can be a good idea to improve this! Then live-helper will be able
# to generate grub's menu.lst for the live CD from binary/ contents... ;-)

# Copy Hypervisor kernel
cp chroot/boot/xen-*.gz binary/live

# Copy Xen config
cp -vrf ../stuff/Xen/dom0/etc/xen/* chroot/etc/xen/
cp -vrf ../stuff/Xen/dom0/etc/skel/* chroot/etc/skel/

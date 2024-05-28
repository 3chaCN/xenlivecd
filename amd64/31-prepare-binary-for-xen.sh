#! /bin/sh

# This script must be run just after lh_build finishes.
# It's needed because I don't know how to tell live-helper to do this
# jobs... Maybe merging some functions from update-grub to live-helper
# can be a good idea to improve this! Then live-helper will be able
# to generate grub's menu.lst for the live CD from binary/ contents... ;-)

# The package must be downloaded and extracted manually : the xen kernel doesn't
# exist anymore after image creation

# Copy Hypervisor kernel
apt download xen-hypervisor-4.17-amd64
dpkg -x xen-hypervisor-*.deb chroot/
cp chroot/boot/xen-*.gz binary/live

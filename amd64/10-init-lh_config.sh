#! /bin/sh

# What day is it?
TODAY=`date +%Y%m%d`

# Run lh_config to prepare all the basic stuff
lb config \
    --mode "debian" \
    -a amd64 \
    -k "xen-amd64 amd64" \
    -d bookworm \
    --apt apt \
    --apt-recommends true \
    --apt-secure true \
    --firmware-binary true \
    --firmware-chroot true \
    --debconf-frontend noninteractive \
    --debconf-priority high \
    --cache true \
    --bootloaders "syslinux grub-efi" \
    --linux-packages "linux-image aufs-modules squashfs-modules xen-hypervisor xen-linux-system linux-image-xen-amd64 xen-tools" \
    --binary-image "iso-hybrid" \
    --chroot-filesystem squashfs \
    --mirror-bootstrap http://ftp.fr.debian.org/debian \
    --mirror-chroot http://ftp.fr.debian.org/debian \
    --mirror-chroot-security http://security.debian.org/ \
    --mirror-binary http://ftp.fr.debian.org/debian \
    --archive-areas "main contrib non-free" \
    --checksums true \
    --initramfs live-initramfs \
    --iso-application "Xen Live build $TODAY" \
    --iso-volume "Xen Debian LiveCD v1.0 " \
    --iso-preparer "ben2b <ben2b@proton.me>" \
    --iso-publisher "Xen Live project; http://wiki.xensource.com/xenwiki/LiveDVD; xen-users@lists.xensource.com" \
    --grub-splash "../stuff/splash.xpm.gz" \
    --source false \
    --clean \
    --verbose 

# make the tmp directories
mkdir tmp ; mkdir -p config/chroot_local-includes/tmp ; chmod 1777 config/chroot_local-includes/tmp
 
cp packages.list config/package-lists/xen.chroot

#    --interactive shell \
#    --bootstrap-flavour minimal|standard
#    --cache-indices true \
#    --cache-packages true \
#    --debian-installer true|live \
#    --use-fakeroot true \

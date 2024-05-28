#! /bin/sh

# What day is it?
TODAY=`date +%Y%m%d`

# Run lh_config to prepare all the basic stuff
lb config \
    --mode "debian" \
    -a amd64 \
    -k "amd64" \
    -d bookworm \
    --apt apt \
    --apt-recommends true \
    --apt-secure true \
    --firmware-binary true \
    --firmware-chroot true \
    --debconf-frontend noninteractive \
    --debconf-priority high \
    --cache false \
    --bootloaders "syslinux grub-efi" \
    --linux-packages "linux-image" \
    --binary-image "iso-hybrid" \
    --chroot-filesystem squashfs \
    --mirror-bootstrap http://ftp.fr.debian.org/debian \
    --mirror-chroot http://ftp.fr.debian.org/debian \
    --mirror-chroot-security http://security.debian.org/ \
    --mirror-binary http://ftp.fr.debian.org/debian \
    --archive-areas "main contrib non-free non-free-firmware" \
    --checksums none \
    --initramfs live-boot \
    --iso-application "Xen Live build $TODAY" \
    --iso-volume "Xen Debian LiveCD v1.0 " \
    --iso-preparer "ben2b <ben2b@proton.me>" \
    --iso-publisher "Xen Live project; http://wiki.xensource.com/xenwiki/LiveDVD; xen-users@lists.xensource.com" \
    --grub-splash "../stuff/splash.xpm.gz" \
    --source false \
    --clean \
    --verbose \
    --bootappend-live "boot=live components hostname=xen-debian username=xen-live"

# make the tmp directories
mkdir tmp ; mkdir -p config/chroot_local-includes/tmp ; chmod 1777 config/chroot_local-includes/tmp
 
cp packages.list config/package-lists/xen.chroot

#    --interactive shell \
#    --bootstrap-flavour minimal|standard
#    --cache-indices true \
#    --cache-packages true \
#    --debian-installer true|live \
#    --use-fakeroot true \

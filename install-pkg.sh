#!/bin/bash
# https://manpages.debian.org/unstable/live-config-doc/live-config.7.fr.html
# https://manpages.debian.org/testing/live-boot-doc/live-boot.7.fr.html
xbps-install docker docker-compose git vim
sudo docker run -it --cap-add=ALL --volume=$builddir:/mnt --volume=$builddir/tmp:/tmp debian

#sudo docker run -it --cap-add=ALL --mount type=bind,source=/run/media/anon/Nouveau\ nom/sources/,target=/usr/src debian
apt update
apt install make git live-build vim -y
cd /usr/src
git clone https://github.com/3chaCN/xenlivecd.git
cd xenlivecd
make amd64


squashfs-tools aufs-tools bridge-utils module-assistant build-essential gawk flex libncurses5 debconf-utils debhelper dpkg-dev kernel-package linux-headers-amd64 ethtool lvm2 mdadm dmraid google-chrome ntfsprogs ntfs-3g vim screen vlan vtun ssh ifupdown multiboot-doc grub-emu mtools xorriso desktop-base console-setup gvfs i965-va-driver-shaders isoquery libasound2-plugins alsa-utils libcuda1 libnvcuvid1 libnvidia-encode1 libbluray-bdj libdv-bin oss-compat fuse fuse3 low-memory-monitor libvisual-0.4-plugins gstreamer1.0-tools jackd2 liblcms2-utils opus-tools pciutils pulseaudio libraw1394-doc librsvg2-bin lm-sensors serdi sordi speex gstreamer1.0-plugins-ugly opencl-icd python3-doc python3-tk python3-venv python3.11-venv python3.11-doc binutils binfmt-support nvidia-vdpau-driver nvidia-tesla-440-vdpau-driver nvidia-tesla-418-vdpau-driver nvidia-legacy-390xx-vdpau-driver

todo : intel-firmware, destination dir
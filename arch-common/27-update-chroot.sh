#! /bin/sh

# mount proc filesystem
mount -t proc none chroot/proc
chroot chroot updatedb
umount chroot/proc

# Change the root password to "live":
sed -i "s/^root::/root:\$1\$XB0iKAYV\$DZM1qDJXQlzDeyszVTipn\/:/" chroot/etc/shadow

chroot chroot update-alternatives --set editor /usr/bin/vim.basic

chroot chroot ln -s /etc/alternatives/xen-default /usr/lib/xen
chroot chroot mv /etc/grub.d/10_linux /etc/grub.d/50_linux
rm -f chroot/etc/ssh/ssh_host_*

mkdir -p chroot/var/lib/xen/kernels

cp ../stuff/menu.hook chroot/usr/share/WindowMaker/menu.hook
cp ../stuff/rules.v4 chroot/etc/iptables/rules.v4
cp ../stuff/rules.v6 chroot/etc/iptables/rules.v6

cp -vrf ../stuff/Xen/dom0/etc/skel/.Xresources chroot/home/livexen

echo "dummy numdummies=6" >> chroot/etc/modules



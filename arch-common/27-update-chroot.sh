#! /bin/sh

# Change the root password to "live":
sed -i "s/^root::/root:\$1\$XB0iKAYV\$DZM1qDJXQlzDeyszVTipn\/:/" chroot/etc/shadow

chroot chroot update-alternatives --set editor /usr/bin/vim.basic

chroot chroot ln -s /etc/alternatives/xen-default /usr/lib/xen
chroot chroot mv /etc/grub.d/10_linux /etc/grub.d/50_linux
rm -f chroot/etc/ssh/ssh_host_*

mkdir -p chroot/var/lib/xen/kernels

echo "dummy numdummies=6" >> chroot/etc/modules

chroot chroot updatedb

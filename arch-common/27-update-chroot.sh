#! /bin/sh

# Change the root password to "live":
sed -i "s/^root::/root:\$1\$XB0iKAYV\$DZM1qDJXQlzDeyszVTipn\/:/" /etc/shadow

update-alternatives --set editor /usr/bin/vim.basic

ln -s /etc/alternatives/xen-default /usr/lib/xen
mv /etc/grub.d/10_linux /etc/grub.d/50_linux
rm -f /etc/ssh/ssh_host_*

mkdir -p /var/lib/xen/kernels

echo "dummy numdummies=6" >> /etc/modules

updatedb

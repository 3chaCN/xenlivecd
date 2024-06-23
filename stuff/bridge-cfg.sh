#!/bin/bash
# select the first ethernet interface available
ifname=$(ip ad |grep -E "^2" | cut -d ':' -f 2 |xargs)
# check if a bridge already exists
bridge=$(nmcli c show | grep br0 | cut -d ' ' -f 1)

echo "Found ${ifname} as ethernet device."
echo "Found ${bridge} as bridge device."

# check if not a wireless intf
if [[ $ifname =~ "^wl.*" ]]; then
	echo "No ethernet interfaces found."
	exit
else
	if [[ $bridge != "" ]]; then
		nmcli c down $bridge
		nmcli c delete $bridge
		nmcli c delete "Ethernet conn 1"
	fi
	nmcli c down "Wired connection 1"
	ip link set $ifname down
	nmcli c a ifname br0 type bridge
	nmcli c a type ethernet ifname eno1 con-name "Ethernet conn 1" master bridge-br0
	nmcli c up bridge-br0
fi

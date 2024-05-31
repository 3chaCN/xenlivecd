#!/bin/bash

# args : ./build-image <output-path>
# dest for /binary directory : pointing to /mnt in container
#
if [ -z $1 ]; then 
	out="/tmp"
else
	out=$1
fi

#folder id
fid=$(uuidgen | sed -n 's/\([az0-9]\)-.*/\1/p')

#output dir
builddir=$out/docker-build.$fid
mkdir $builddir

#sed -i "s/{mountpoint}/$\{out\}/g" compose.yaml
#docker compose up
sudo docker build -t xenlivecd:latest .
sudo docker run --cap-add=ALL --privileged --volume=$builddir:/usr/src xenlivecd:latest

isofile=$(ls ${builddir}/xenlivecd/amd64/live-image-amd64.hybrid.iso)
if [ -z $isofile ]; then
	echo Creation of iso image has failed. Check the logs in ${builddir}/xenlivecd
 	exit -1
else
	mv $isofile $builddir/livecd-xen-debian-1.0-amd64.iso
	echo "ISO file written to ${builddir}/livecd-xen-debian-1.0-amd64.iso"
fi
exit



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
sudo docker run --cap-add=ALL --volume=$builddir:/usr/src xenlivecd:latest

echo "ISO file written to livecd-xen-debian-${VERSION}-amd64.iso."
exit

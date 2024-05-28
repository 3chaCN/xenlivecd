#!/bin/bash

# args : ./build-image <output-path>

if [ -z $1 ]; then 
	out="/tmp"
else
	out=$1
fi


sed -i 's/{mountpoint}/${out}/g' Dockerfile
sudo docker build -t xenlivecd:latest .
sudo docker run --cap-add=ALL xenlivecd:latest

echo "ISO file written to livecd-xen-debian-${VERSION}-amd64.iso."
exit

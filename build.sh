#!/bin/bash
apt update
apt install -y make git live-build
cd /usr/src
git clone https://github.com/3chaCN/xenlivecd.git
cd xenlivecd
make amd64

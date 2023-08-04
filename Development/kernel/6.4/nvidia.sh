#!/bin/bash
#
# Install nvidia kernel modules
#
set -e

VERSION=6.4.8
NVIDIA=${NVIDIA:-535.86.05}
NUMJOBS=${NUMJOBS:-$(expr $(nproc) + 1)}

set -e

if [ ! $UID = 0 ]; then
  echo You must be 'root' to execute this script!
  exit 1
fi

# install nvidia modules
if [ -d /usr/src/nvidia-$NVIDIA ]; then
  cd /usr/src/nvidia-$NVIDIA
  make clean
  KERNEL_UNAME=$VERSION make -j$NUMJOBS  modules
  KERNEL_UNAME=$VERSION make -j$NUMJOBS  modules_install
  depmod -a
fi

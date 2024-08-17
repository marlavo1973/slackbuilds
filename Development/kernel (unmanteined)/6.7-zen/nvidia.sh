#!/bin/bash
#
# Install nvidia kernel modules
#
set -e

export VERSION=6.7.4-zen1
export NVIDIA=535.154.05
export NUMJOBS=$(expr $(nproc) + 1)

set -e

if [ ! $UID = 0 ]; then
  echo You must be 'root' to execute this script!
  exit 1
fi

# install nvidia modules
if [ -d /usr/src/nvidia-$NVIDIA ]; then
  cd /usr/src/nvidia-$NVIDIA
  KERNEL_UNAME=$VERSION make clean
  KERNEL_UNAME=$VERSION make -j$NUMJOBS  modules
  KERNEL_UNAME=$VERSION make -j$NUMJOBS  modules_install
  depmod -a
fi

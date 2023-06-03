#!/bin/bash
#
# Install nvidia kernel modules
#
set -e

VERSION=6.3.5
NVIDIA=${NVIDIA:-530.41.03}

# install nvidia modules
if [ -d /usr/src/nvidia-$NVIDIA ]; then
  cd /usr/src/nvidia-$NVIDIA
  make clean
  KERNEL_UNAME=$VERSION make modules
  KERNEL_UNAME=$VERSION make modules_install
fi
#!/bin/bash

mkdir -p build/Release
cd build/Release || exit 1

cmake -DCMAKE_TOOLCHAIN_FILE=../../Linux-XilinxBoard-enterprise-image.cmake \
-DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
-DCMAKE_BUILD_TYPE=Release \
-DCMAKE_INSTALL_PREFIX=/usr \
-DCMAKE_INSTALL_FULL_SYSCONFDIR=/etc \
../../

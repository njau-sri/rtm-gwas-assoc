#!/bin/bash

LIB=/usr/local/lib

LIBGFORTRAN=$LIB/libgfortran.a
LIBQUADMATH=$LIB/libquadmath.a
LIBGCC=$LIB/gcc/x86_64-apple-darwin17.5.0/8.1.0/libgcc.a

rm -rf macos
mkdir macos

TARGET=macos/rtm-gwas-assoc

if [ -z "$RTM_GWAS_VERSION" ]; then
    RTM_GWAS_VERSION=unknown
fi

g++ src/*.cpp -o $TARGET -O2 -std=c++11 -lopenblas $LIBGFORTRAN $LIBQUADMATH $LIBGCC \
    -DRTM_GWAS_VERSION=$RTM_GWAS_VERSION

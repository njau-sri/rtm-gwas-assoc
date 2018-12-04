#!/bin/bash

MKLROOT=/opt/intel/compilers_and_libraries/mac/mkl

LIBMKL1=$MKLROOT/lib/libmkl_intel_lp64.a
LIBMKL2=$MKLROOT/lib/libmkl_sequential.a
LIBMKL3=$MKLROOT/lib/libmkl_core.a

rm -rf macos
mkdir macos

TARGET=macos/rtm-gwas-assoc

if [ -z "$RTM_GWAS_VERSION" ]; then
    RTM_GWAS_VERSION=unknown
fi

g++ *.cpp -o $TARGET -O2 -std=c++11 $LIBMKL1 $LIBMKL2 $LIBMKL3 -lpthread -lm -ldl \
    -DRTM_GWAS_VERSION=$RTM_GWAS_VERSION

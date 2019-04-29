#!/bin/bash

MKLROOT=/opt/intel/mkl

LIB1=$MKLROOT/lib/libmkl_intel_lp64.a
LIB2=$MKLROOT/lib/libmkl_sequential.a
LIB3=$MKLROOT/lib/libmkl_core.a

rm -rf macos
mkdir macos

TARGET=macos/rtm-gwas-assoc

if [ -z "$RTM_GWAS_VERSION" ]; then
    RTM_GWAS_VERSION=unknown
fi

g++ src/*.cpp -o $TARGET -O2 -std=c++11 $LIB1 $LIB2 $LIB3 -lpthread -lm -ldl \
    -DRTM_GWAS_VERSION=$RTM_GWAS_VERSION

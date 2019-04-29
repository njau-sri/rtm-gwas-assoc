#!/bin/bash

MKLROOT=/opt/intel/mkl

LIB1=$MKLROOT/lib/intel64/libmkl_intel_lp64.a
LIB2=$MKLROOT/lib/intel64/libmkl_sequential.a
LIB3=$MKLROOT/lib/intel64/libmkl_core.a

rm -rf glnx64
mkdir glnx64

TARGET=glnx64/rtm-gwas-assoc

if [ -z "$RTM_GWAS_VERSION" ]; then
    RTM_GWAS_VERSION=unknown
fi

g++ src/*.cpp -o $TARGET -s -O2 -std=c++11 -static -fopenmp \
    -Wl,--start-group $LIB1 $LIB2 $LIB3 -Wl,--end-group \
    -lpthread -lm -ldl -DRTM_GWAS_VERSION=$RTM_GWAS_VERSION

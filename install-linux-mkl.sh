#!/bin/bash

MKLROOT=/opt/intel/compilers_and_libraries/linux/mkl

LIBMKL1=${MKLROOT}/lib/intel64/libmkl_intel_lp64.a
LIBMKL2=${MKLROOT}/lib/intel64/libmkl_sequential.a
LIBMKL3=${MKLROOT}/lib/intel64/libmkl_core.a

rm -rf lnx64
mkdir lnx64

g++ *.cpp -o lnx64/rtm-gwas-assoc -s -O2 -std=c++11 -static -fopenmp \
    -Wl,--start-group ${LIBMKL1} ${LIBMKL2} ${LIBMKL3} -Wl,--end-group \
    -lpthread -lm -ldl

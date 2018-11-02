#!/bin/bash

rm -rf $1
mkdir $1

if [ $1 == "lnx64" ]; then

    g++ *.cpp -o $1/rtm-gwas-assoc -s -O2 -std=c++11 -static -lopenblas -lgfortran -lquadmath -fopenmp

elif [ $1 == "win32" ]; then

    i686-w64-mingw32-g++ *.cpp -o $1/rtm-gwas-assoc.exe -s -O2 -std=c++11 -static -lopenblas -lgfortran -lquadmath

elif [ $1 == "win64" ]; then

    x86_64-w64-mingw32-g++ *.cpp -o $1/rtm-gwas-assoc.exe -s -O2 -std=c++11 -static -llopenblas -lgfortran -lquadmath

fi

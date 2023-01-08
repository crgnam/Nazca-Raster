#!/bin/bash

# Pull submodules if haven't already:
git submodule update --init
git pull --recurse-submodules

# Setup external libraries:
cd external

# Setup oneTBB library:
cd oneTBB
mkdir -p prefix
mkdir -p build
cd build
cmake -DCMAKE_INSTALL_PREFIX=../prefix -DTBB_TEST=OFF ..
cmake --build . -j
cmake --install .
cd ../../

# Setup the GKlib library:
cd GKlib
mkdir -p prefix
mkdir -p build
cd build
cmake -DCMAKE_INSTALL_PREFIX=../prefix ..
cmake --build . -j
cmake --install .
cd ../../

# Setup the METIS library:
cd METIS
mkdir -p prefix
make config prefix=../prefix gklib_path=../GKlib/prefix #(GKLib path is done from root, install path done relative to build)
make install -j
cd ../

# Setup ImageMagick library:
# cd ImageMagick
# mkdir -p prefix
# mkdir -p prefix/lib
# ./configure --prefix=$PWD/prefix --libdir=$PWD/prefix/lib
# make install
# cd ../../

# Exit external libraries directory
cd ../

# Build the project:
mkdir -p build
cd build
cmake ..
make -j
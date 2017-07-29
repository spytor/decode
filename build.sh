#!/bin/bash

# Digital Speech Decoder 1.6.0
# mbelib version 1.2.5

echo "Cleaning up..."
rm -rf /tmp/dsd
rm -rf /tmp/mbelib

echo "Copying files..."
cp -r mbelib /tmp/
cp -r dsd /tmp/

#### Compile mbelib
echo "Compiling mbelib..."
cd /tmp/mbelib/
mkdir build
cd build
cmake ..
make

#### Compile dsd
echo "Compiling dsd..."
cd /tmp/dsd
perl -p -i -e 's{/usr/local/include}{/tmp/mbelib/}g; s{-lmbe}{/tmp/mbelib/build/libmbe.a}' Makefile
make
sudo make install
echo
echo "Done"
echo

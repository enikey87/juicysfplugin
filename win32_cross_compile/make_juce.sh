#!/usr/bin/env bash
cd JUCE

export CXXFLAGS="-I/usr/include/freetype2"
export CFLAGS="-I/usr/include/freetype2"
cmake -B build -DCMAKE_INSTALL_PREFIX="/linux_native"
cmake --build build --target install
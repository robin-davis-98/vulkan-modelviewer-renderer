#!/usr/bin/env bash

BUILD_DIR = "build"

if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin"]]; then
    TOOLCHAIN="-DCMAKE_TOOLCHAIN_FILE=cmake/clang-mingw-toolchain.cmake"
else
    TOOLCHAIN=""
fi

cmake -S . -B "$BUILD_DIR" -DCMAKE_BUILD_TYPE=Release $TOOLCHAIN
cmake --build "$BUILD_DIR" --config Release
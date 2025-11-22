#!/usr/bin/env bash

PROJECT_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"
BUILD_DIR="$PROJECT_ROOT/build"

if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
    TOOLCHAIN="-DCMAKE_TOOLCHAIN_FILE=$PROJECT_ROOT/cmake/clang-mingw-toolchain.cmake"
else
    TOOLCHAIN=""
fi

cmake -S "$PROJECT_ROOT" -B "$BUILD_DIR" -DCMAKE_BUILD_TYPE=Release $TOOLCHAIN
cmake --build "$BUILD_DIR" --config Release
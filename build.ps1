$buildDir = "build"

$toolchain = "-DCMAKE_TOOLCHAIN_FILE=cmake/clang-mingw-toolchain.cmake"

cmake -S . -B $buildDir -DCMAKE_BUILD_TYPE=Release $toolchain
cmake --build $buildDir --config Release
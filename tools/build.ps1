$projectRoot = Resolve-Path "$PSScriptRoot/.."
$buildDir = "$projectRoot/build"

$toolchain = "-DCMAKE_TOOLCHAIN_FILE=`"$projectRoot/cmake/clang-mingw-toolchain.cmake`""

cmake -S "$projectRoot" -B $buildDir -DCMAKE_BUILD_TYPE=Release $toolchain
cmake --build "$buildDir" --config Release
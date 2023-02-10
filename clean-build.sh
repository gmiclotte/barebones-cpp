# required tools
# clang with extra tools (tested with clang-*-15)
# conan
# cppcheck
# cmake 3.18

# force clang
export CC=/usr/bin/clang
export CXX=/usr/bin/clang++

# build directory
build_type=${1:-Debug}
build=build-${build_type}

# conan manages dependencies
mkdir -p "${build}"
cd "${build}" || exit
    rm -rf ./*
    conan install .. --build=missing -s build_type="${build_type}" -s compiler.libcxx=libstdc++11
    cmake .. \
        -DCMAKE_TOOLCHAIN_FILE="${build}"/conan_toolchain.cmake \
        -DCONAN_BUILD_INFO_FILE="${build}"/conanbuildinfo.cmake \
        -DCMAKE_BUILD_TYPE="${build_type}" \
        -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
    # build
    cmake --build .
cd ..

bash ./test.sh "${build_type}"
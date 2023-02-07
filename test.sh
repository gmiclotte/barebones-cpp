build_type=${1:-Debug}
build=build-${build_type}

# clear coverage counters
rm -f ./"${build}"/*/CMakeFiles/*.dir/*.gcda

# run tests
./"${build}"/bin/helloTest

if [ "${build_type}" != "Debug" ]; then
    exit;
fi

# gather coverage statistics
mkdir -p coverage
gcovr ./"${build}"/src --html --html-details --gcov-executable="llvm-cov gcov" -o coverage/coverage.html
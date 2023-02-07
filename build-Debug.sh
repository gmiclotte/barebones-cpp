# force clang
export CC=/usr/bin/clang
export CXX=/usr/bin/clang++

# build directory
build_type=Debug
build=build-${build_type}

# create output directory
analysis=analysis
mkdir -p "${analysis}"

# build with clang
cd  ${build} || exit
    cmake --build .
    # link compile commands for clang-tidy and cpp-check
    cp ./compile_commands.json ../analysis/
cd .. || exit

# aggressively run clang-tidy on src/*.*
python scripts/run-clang-tidy.py -p="${analysis}" -fix > "${analysis}"/clang-tidy.log
clang-tidy-html "${analysis}"/clang-tidy.log -o "${analysis}"/clang-tidy.html

# run cppcheck on src/*.*
cppcheck --enable=warning,performance,portability,information,missingInclude \
         --project="${analysis}"/compile_commands.json \
         --template="[{severity}][{id}] {message} {callstack} \(On {file}:{line}\)" \
         --output-file="${analysis}"/cppcheck.log

bash ./test.sh ${build_type}
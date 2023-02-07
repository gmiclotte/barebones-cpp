cmake_minimum_required(VERSION 3.18)
project(hello)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/scripts/cmake")

include(${CONAN_BUILD_INFO_FILE})
conan_basic_setup()

include(clangformat)

add_compile_definitions("BUILDDIR=\"${CMAKE_CURRENT_BINARY_DIR}\"")

add_compile_options(-mpopcnt)

# get git sha (short) (see https://stackoverflow.com/a/3153300)
exec_program("git" "${CMAKE_CURRENT_SOURCE_DIR}"
        ARGS describe --match=NeVeRmAtCh --always --abbrev=7 --dirty
        OUTPUT_VARIABLE VERSION_SHA1 )

add_definitions("-DGIT_SHA1=\"${VERSION_SHA1}\"")

# uncomment the portion below to disable assertions
if (CMAKE_BUILD_TYPE STREQUAL Release)
    add_definitions(-DNDEBUG)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -O3")
else (CMAKE_BUILD_TYPE STREQUAL Release)
    add_definitions(-DDEBUG)
    include(CodeCoverage)
    append_coverage_compiler_flags()
    set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
endif (CMAKE_BUILD_TYPE STREQUAL Release)

add_subdirectory(src)
add_subdirectory(tests)
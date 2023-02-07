# create library for linking to executable and to tests
add_library(helloLib
        hello.h
        hello.cpp
)

# create executable
add_executable(hello
    main.cpp
)

# set library to C++20
target_compile_features(helloLib PUBLIC cxx_std_20)

# link
target_link_libraries(hello PRIVATE helloLib)

# make library
target_include_directories(helloLib PUBLIC .)

# install binary
install(TARGETS hello RUNTIME DESTINATION bin)

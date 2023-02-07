add_executable(helloTest
        hello_test.cpp
        main.cpp)

# get GoogleTest
find_package(GTest)

# link
target_link_libraries(helloTest PRIVATE GTest::GTest)
target_link_libraries(helloTest PRIVATE helloLib)
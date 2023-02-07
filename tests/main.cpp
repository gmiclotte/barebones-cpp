#include <gtest/gtest.h>

auto main(int argc, char** argv) -> int {
    printf("Running main() from tests/main.cpp\n");
    testing::InitGoogleTest(&argc, argv);
    RUN_ALL_TESTS();
    return 0;
}
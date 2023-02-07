#include "../src/hello.h"

#include <gtest/gtest.h>

TEST(HelloTest /*unused*/, getTarget /*unused*/) {
    std::string const target = "tester";
    Hello const hello{target};
    EXPECT_EQ(hello.getTarget(), "tester");
}

TEST(HelloTest /*unused*/, crash /*unused*/) {
    std::string const target = "tester";
    Hello const hello{target};
    EXPECT_DEATH(hello.crash(), "");
}
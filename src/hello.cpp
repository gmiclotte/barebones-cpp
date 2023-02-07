#include "hello.h"

#include <iostream>

using namespace std;

void Hello::hello() const { std::cout << "Hello " << target << "\n"; }

void Hello::crash() const {
    hello();
    abort();
}
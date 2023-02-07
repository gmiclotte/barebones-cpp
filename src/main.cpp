#include <iostream>

#include "hello.h"

using namespace std;

auto main(int /*argc*/, char** /*argv*/) -> int {
    try {
        cout << "Welcome to Hello";

#ifdef DEBUG
        cout << " (debug mode)" << endl;
#else
        cout << " (release mode)" << endl;
#endif

        cout << " (commit " << GIT_SHA1 << ")";

        std::string const target = "you";
        Hello const h{target};
        h.hello();
    } catch (exception& e) {
        cerr << "Fatal error: " << e.what() << endl;
        return EXIT_FAILURE;
    }

    cout << "Exiting... bye!" << endl;
    return EXIT_SUCCESS;
}

file(GLOB_RECURSE ALL_SOURCE_FILES src/*.cpp src/*.h)

add_custom_target(
        cppcheck 
        ALL
        COMMAND cppcheck
        --enable=warning,performance,portability,information,missingInclude
        --std=c++20
        --language=c++
        --library=std.cfg
        --template="[{severity}][{id}] {message} {callstack} \(On {file}:{line}\)"
        ${ALL_SOURCE_FILES}
)
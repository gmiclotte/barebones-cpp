file(GLOB SOURCE_FILES src/*.cpp src/*.h tests/*.cpp tests/*.h)

add_custom_target(
    clangformat
    ALL
    COMMAND clang-format
    -style=file
    -i
    ${SOURCE_FILES}
)

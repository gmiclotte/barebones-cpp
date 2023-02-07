### required tools
 - clang with extra tools
   - tested with clang-*-15
   - in path without version numbers, i.e. `clang-tidy` and not `clang-tidy-15`
 - conan
 - cppcheck
 - cmake 3.18+

### initial build
```
bash clean-build.sh
bash clean-build.sh Release
```

### rebuild and test Debug
```
bash build-Debug.sh
```
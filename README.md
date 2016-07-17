= Generic CMake

This is an attempt to create a cmake build environment for bare-metal mcu
builds with cmake.

For this I extend the "Generic" platform files. Right now for GCC and Clang
compilers.

== Structure

CMake chooses the platform file depending on the values of
- CMAKE_SYSTEM_NAME
- CMAKE_SYSTEM_PROCESSOR
- current language (C,CXX)

as you have set them in your toolchain file.

```
├── cmake                               # cmake module dir, prepared for inclusion in a project
│   ├── cortex-m4f-hard-clang.cmake     # example toolchain file for cortex-m4f for Clang
│   ├── cortex-m4f-hard-gnu.cmake       # example toolchain file for cortex-m4f for GCC
│   └── Platform
│       ├── Generic-Clang-ARM.cmake     # Common Clang ARM specific
│       ├── Generic-Clang-C-ARM.cmake   # Clang C Platform file for CMAKE_SYSTEM_NAME:Generic CMAKE_SYSTEM_PROCESSOR:ARM
│       ├── Generic-Clang-CXX-ARM.cmake # Clang CXX Platform file for CMAKE_SYSTEM_NAME:Generic CMAKE_SYSTEM_PROCESSOR:ARM
│       ├── Generic-GNU-ARM.cmake       # Common GCC ARM specific
│       ├── Generic-GNU-C-ARM.cmake     # GCC C Platform file for CMAKE_SYSTEM_NAME:Generic CMAKE_SYSTEM_PROCESSOR:ARM
│       └── Generic-GNU-CXX-ARM.cmake   # GCC CXX Platform file for CMAKE_SYSTEM_NAME:Generic CMAKE_SYSTEM_PROCESSOR:ARM
└── CMakeLists.txt                      # Example for a project
```

== Usage

At least cmake version 3.6 is needed.
The example also shows the usage of ninja as buildtool.

```
mkdir build && cd build
cmake .. -DCMAKE_TOOLCHAIN_FILE=../cmake/cortex-m4f-hard-gnu.cmake -GNinja
ninja
```

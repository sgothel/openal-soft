# Cross-compiling requires CMake 2.6 or newer. To use it from build/, call it
# like this:
# cmake .. -DCMAKE_TOOLCHAIN_FILE=../XCompile.txt -DHOST=i686-pc-mingw32
# Where 'i686-pc-mingw32' is the host prefix for your cross-compiler. If you
# already have a toolchain file setup, you may use that instead of this file.

# the name of the target operating system
SET(CMAKE_SYSTEM_NAME Windows)

# which compilers to use for C and C++
SET(CMAKE_C_COMPILER "gcc.exe")
SET(CMAKE_CXX_COMPILER "g++.exe")

set(LINKER_FLAGS "-static -static-libgcc -static-libstdc++")

set(CMAKE_SHARED_LINKER_FLAGS "${LINKER_FLAGS}" CACHE STRING "linker flags" FORCE)
set(CMAKE_MODULE_LINKER_FLAGS "${LINKER_FLAGS}" CACHE STRING "linker flags" FORCE)
set(CMAKE_EXE_LINKER_FLAGS "${LINKER_FLAGS}" CACHE STRING "linker flags" FORCE)

# here is the target environment located
#SET(CMAKE_FIND_ROOT_PATH "/usr/${HOST}")

# here is where stuff gets installed to
#SET(CMAKE_INSTALL_PREFIX "${CMAKE_FIND_ROOT_PATH}/usr" CACHE STRING "Install path prefix, prepended onto install directories." FORCE)

# adjust the default behaviour of the FIND_XXX() commands:
# search headers and libraries in the target environment, search 
# programs in the host environment
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

# set env vars so that pkg-config will look in the appropriate directory for
# .pc files (as there seems to be no way to force using ${HOST}-pkg-config)
set(ENV{PKG_CONFIG_LIBDIR} "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig")
set(ENV{PKG_CONFIG_PATH} "")

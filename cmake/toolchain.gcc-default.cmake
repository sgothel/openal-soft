# For normal gcc compilation, but use static-libgcc

if(NOT APPLE)
    set(CMAKE_C_FLAGS "-include ${PROJECT_SOURCE_DIR}/cmake/glibc-compat-symbols.h")
    set(CMAKE_CXX_FLAGS "-include ${PROJECT_SOURCE_DIR}/cmake/glibc-compat-symbols.h")
endif()

set(CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS}" CACHE STRING "c++ flags")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS}" CACHE STRING "c flags")

set(LINKER_FLAGS "-static-libgcc -static-libstdc++")
message(STATUS "LINKER_FLAGS: ${LINKER_FLAGS}")

set(CMAKE_SHARED_LINKER_FLAGS "${LINKER_FLAGS}" CACHE STRING "linker flags" FORCE)
set(CMAKE_MODULE_LINKER_FLAGS "${LINKER_FLAGS}" CACHE STRING "linker flags" FORCE)
set(CMAKE_EXE_LINKER_FLAGS "${LINKER_FLAGS}" CACHE STRING "linker flags" FORCE)


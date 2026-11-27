# Use system GoogleTest and FlatBuffers instead of FetchContent downloads.
#
# Injected after project() via CMAKE_PROJECT_rocm_jit_suite_INCLUDE.

find_package(GTest CONFIG REQUIRED)
find_package(flatbuffers CONFIG REQUIRED GLOBAL)

# Upstream links and runs the in-tree target names.
add_library(flatbuffers ALIAS flatbuffers::flatbuffers_shared)
add_executable(flatc ALIAS flatbuffers::flatc)

include(FetchContent)
FetchContent_Declare(googletest FIND_PACKAGE_ARGS NAMES GTest CONFIG REQUIRED)
FetchContent_Declare(flatbuffers FIND_PACKAGE_ARGS CONFIG REQUIRED)

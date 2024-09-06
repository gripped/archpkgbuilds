cmake_minimum_required(VERSION 3.20)

# Grab the version
file(READ "src/version.h" ver)
if (NOT ${ver} MATCHES "COMPILER_VERSION \"([0-9]+.[0-9]+.[0-9]+)\"")
    message(FATAL_ERROR "Compiler version could not be parsed from version.h")
endif()

# Set the project and version
project(c3c VERSION ${CMAKE_MATCH_1})
message("C3C version: ${CMAKE_PROJECT_VERSION}")

# Avoid warning for FetchContent
if (CMAKE_VERSION VERSION_GREATER_EQUAL "3.24.0")
    cmake_policy(SET CMP0135 NEW)
endif()

# Enable fetching (for Windows)
include(FetchContent)
include(FeatureSummary)

set(CMAKE_FIND_PACKAGE_SORT_ORDER NATURAL)
set(CMAKE_FIND_PACKAGE_SORT_DIRECTION DEC)

# We use C11 and C++17
set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)

set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -O3 -fno-exceptions")
set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -gdwarf-3 -O3 -fno-exceptions")

option(C3_LINK_DYNAMIC "link dynamically with LLVM/LLD libs")
set(C3_LINK_DYNAMIC ON)

set(C3_LLVM_VERSION "auto" CACHE STRING "Use LLVM version [default: auto]")
option(C3_USE_MIMALLOC "Use built-in mimalloc" OFF)
option(C3_USE_TB "Use TB" OFF)
set(C3_MIMALLOC_TAG "v1.7.3" CACHE STRING "Used version of mimalloc")

set(C3_USE_MIMALLOC OFF)

find_package(CURL)

set(GIT_HASH "unknown")
file(WRITE ${CMAKE_BINARY_DIR}/git_hash.h "#pragma once\n#define GIT_HASH \"${GIT_HASH}\"\n")

find_package(LLVM REQUIRED CONFIG)

message(STATUS "Found LLVM ${LLVM_PACKAGE_VERSION}")
message(STATUS "Using LLVMConfig.cmake in: ${LLVM_DIR}")
message(STATUS "Libraries located in: ${LLVM_LIBRARY_DIRS}")

if(LLVM_ENABLE_RTTI)
    message(STATUS "LLVM was built with RTTI")
else()
    message(STATUS "LLVM was not built with RTTI")
endif()

string(REPLACE "." ";" VERSION_LIST ${LLVM_PACKAGE_VERSION})
list(GET VERSION_LIST 0 LLVM_MAJOR_VERSION)

include_directories(${LLVM_INCLUDE_DIRS})
link_directories(${LLVM_LIBRARY_DIRS})
add_definitions(${LLVM_DEFINITIONS})

find_library(LLVM NAMES libLLVM.so PATHS ${LLVM_LIBRARY_DIRS} NO_DEFAULT_PATH)
set(llvm_libs ${LLVM})

message(STATUS "using find_library")
find_library(LLD_COFF NAMES liblldCOFF.so PATHS ${LLVM_LIBRARY_DIRS} NO_DEFAULT_PATH)
find_library(LLD_COMMON NAMES liblldCommon.so PATHS ${LLVM_LIBRARY_DIRS} NO_DEFAULT_PATH)
find_library(LLD_ELF NAMES liblldELF.so PATHS ${LLVM_LIBRARY_DIRS} NO_DEFAULT_PATH)
find_library(LLD_MACHO NAMES liblldMachO.so PATHS ${LLVM_LIBRARY_DIRS} NO_DEFAULT_PATH)
find_library(LLD_MINGW NAMES liblldMinGW.so PATHS ${LLVM_LIBRARY_DIRS} NO_DEFAULT_PATH)
find_library(LLD_WASM NAMES liblldWasm.so PATHS ${LLVM_LIBRARY_DIRS} NO_DEFAULT_PATH)

if (NOT(${CMAKE_BINARY_DIR} EQUAL ${CMAKE_SOURCE_DIR}))
    file(REMOVE_RECURSE ${CMAKE_BINARY_DIR}/lib)
    file(COPY ${CMAKE_SOURCE_DIR}/lib DESTINATION ${CMAKE_BINARY_DIR})
endif()

find_library(LLD_LOONG NAMES libLLVMLoongArchCodeGen.lib libLLVMLoongArchAsmParser.lib libLLVMLoongArchCodeGen.a libLLVMLoongArchAsmParser.a PATHS ${LLVM_LIBRARY_DIRS} NO_DEFAULT_PATH)
set(lld_libs
    ${LLD_COFF}
    ${LLD_COMMON}
    ${LLD_WASM}
    ${LLD_MINGW}
    ${LLD_ELF}
    ${LLD_MACHO}
    )

message(STATUS "linking to llvm libs ${lld_libs}")
message(STATUS "Found lld libs ${lld_libs}")

add_library(c3c_wrappers STATIC wrapper/src/wrapper.cpp)
add_library(miniz STATIC dependencies/miniz/miniz.c)

add_executable(c3c
        src/build/builder.c
        src/build/build_options.c
        src/build/project_creation.c
        src/build/project_manipulation.c
        src/build/libraries.c
        src/compiler/ast.c
        src/compiler/bigint.c
        src/compiler/codegen_general.c
        src/compiler/compiler.c
        src/compiler/compiler.h
        src/compiler/subprocess.c
        src/compiler/subprocess.h
        src/compiler/context.c
        src/compiler/copying.c
        src/compiler/diagnostics.c
        src/compiler/float.c
        src/compiler/headers.c
        src/compiler/json_output.c
        src/compiler/lexer.c
        src/compiler/linker.c
        src/compiler/llvm_codegen.c
        src/compiler/abi/c_abi_aarch64.c
        src/compiler/abi/c_abi.c
        src/compiler/abi/c_abi_riscv.c
        src/compiler/abi/c_abi_wasm.c
        src/compiler/abi/c_abi_win64.c
        src/compiler/abi/c_abi_x64.c
        src/compiler/abi/c_abi_x86.c
        src/compiler/llvm_codegen_debug_info.c
        src/compiler/llvm_codegen_expr.c
        src/compiler/llvm_codegen_function.c
        src/compiler/llvm_codegen_instr.c
        src/compiler/llvm_codegen_module.c
        src/compiler/llvm_codegen_stmt.c
        src/compiler/llvm_codegen_type.c
        src/compiler/llvm_codegen_value.c
        src/compiler/module.c
        src/compiler/number.c
        src/compiler/parse_expr.c
        src/compiler/parse_global.c
        src/compiler/parser.c
        src/compiler/parser_internal.h
        src/compiler/parse_stmt.c
        src/compiler/sema_casts.c
        src/compiler/sema_decls.c
        src/compiler/sema_expr.c
        src/compiler/sema_internal.h
        src/compiler/sema_name_resolution.c
        src/compiler/sema_errors.c
        src/compiler/sema_builtins.c
        src/compiler/sema_initializers.c
        src/compiler/semantic_analyser.c
        src/compiler/sema_passes.c
        src/compiler/sema_stmts.c
        src/compiler/sema_types.c
        src/compiler/source_file.c
        src/compiler/symtab.c
        src/compiler/target.c
        src/compiler/sema_asm.c
        src/compiler_tests/benchmark.c
        src/compiler_tests/tests.c
        src/compiler/tokens.c
        src/compiler/types.c
        src/main.c
        src/utils/errors.c
        src/utils/file_utils.c
        src/utils/find_msvc.c
        src/utils/malloc.c
        src/utils/stringutils.c
        src/utils/taskqueue.c
        src/utils/json.c
        src/build/project.c
        src/utils/vmem.c
        src/utils/vmem.h
        src/utils/whereami.c
        src/utils/cpus.c
        src/utils/unzipper.c
        src/compiler/decltable.c
        src/compiler/mac_support.c
        src/compiler/llvm_codegen_storeload.c
        src/compiler/windows_support.c
        src/compiler/codegen_asm.c
        src/compiler/asm_target.c
        src/compiler/llvm_codegen_builtins.c
        src/compiler/expr.c
        src/utils/time.c
        src/utils/http.c
        src/compiler/sema_liveness.c
        src/build/common_build.c
        ${CMAKE_BINARY_DIR}/git_hash.h
        )

target_compile_definitions(c3c PUBLIC TB_AVAILABLE=0)

target_include_directories(c3c PRIVATE
        "${CMAKE_SOURCE_DIR}/src/"
        "${CMAKE_SOURCE_DIR}/wrapper/include/"
        "${CMAKE_BINARY_DIR}")

target_include_directories(c3c_wrappers PRIVATE
        "${CMAKE_SOURCE_DIR}/wrapper/include/")

target_include_directories(miniz PUBLIC
        "${CMAKE_SOURCE_DIR}/dependencies/miniz/")

target_link_libraries(c3c_wrappers ${llvm_libs} ${lld_libs})
target_link_libraries(c3c ${llvm_libs} miniz c3c_wrappers ${lld_libs})

target_link_libraries(c3c ${CURL_LIBRARIES})
target_include_directories(c3c PRIVATE ${CURL_INCLUDES})
target_compile_definitions(c3c PUBLIC CURL_FOUND=1)

message(STATUS "using gcc/clang warning switches")
target_link_options(c3c PRIVATE -pthread)
if (NOT LLVM_ENABLE_RTTI)
    target_compile_options(c3c_wrappers PRIVATE -fno-rtti)
endif()
target_compile_options(c3c PRIVATE -pthread -Wall -Werror -Wno-unknown-pragmas -Wno-unused-result -Wno-unused-function -Wno-unused-variable -Wno-unused-parameter)

install(TARGETS c3c DESTINATION bin)
install(DIRECTORY lib/ DESTINATION lib/c3)

if (DEFINED sanitizer_runtime_libraries)
    add_custom_command(TARGET c3c POST_BUILD
        COMMAND "${CMAKE_COMMAND}" -E rm -rf -- $<TARGET_FILE_DIR:c3c>/c3c_rt
        COMMAND "${CMAKE_COMMAND}" -E make_directory $<TARGET_FILE_DIR:c3c>/c3c_rt
        COMMAND "${CMAKE_COMMAND}" -E copy ${sanitizer_runtime_libraries} $<TARGET_FILE_DIR:c3c>/c3c_rt
        VERBATIM
        COMMENT "Copying sanitizer runtime libraries to output directory")

    install(DIRECTORY $<TARGET_FILE_DIR:c3c>/c3c_rt/ DESTINATION bin/c3c_rt)
endif()

feature_summary(WHAT ALL)

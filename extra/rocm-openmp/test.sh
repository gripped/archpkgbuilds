#! /usr/bin/env sh
# Verifies that OpenMP GPU offloading works for Fortran, C and C++.
# Usage: ./test.sh [gfx-arch]
set -eu

_llvm=/opt/rocm/lib/llvm/bin
_arch=${1:-$("$_llvm"/amdgpu-arch | head -n1)}

if [ -z "$_arch" ]; then
    echo "No AMD GPU detected, pass the target arch explicitly (e.g. ./test.sh gfx1103)" >&2
    exit 1
fi

OUT=$(mktemp -d)

"$_llvm"/amdflang -fopenmp --offload-arch="$_arch" test.f90 -o "$OUT"/test-f90
"$OUT"/test-f90

"$_llvm"/amdclang -fopenmp --offload-arch="$_arch" test.c -o "$OUT"/test-c
"$OUT"/test-c

"$_llvm"/amdclang++ -fopenmp --offload-arch="$_arch" test.cpp -o "$OUT"/test-cpp
"$OUT"/test-cpp

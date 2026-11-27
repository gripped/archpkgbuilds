#! /usr/bin/env sh
set -e

OUT=$(mktemp -d)
HIPFORT=/opt/rocm/lib/fortran/gfortran
# Arch selection doesn't work with integrated APU, so we just pick the first
# arch listed by the agent enumerator
/opt/rocm/bin/hipcc --offload-arch=$(rocm_agent_enumerator | head -n1) \
    -c test.cpp -o "$OUT"/test_cpp.o
gfortran -I/opt/rocm/include/fortran/gfortran/hipfort/amdgcn test.f03 "$OUT"/test_cpp.o \
    -L"$HIPFORT" -lhipfort-amdgcn -L/opt/rocm/lib -lamdhip64 -lstdc++ -o "$OUT"/test
"$OUT"/test

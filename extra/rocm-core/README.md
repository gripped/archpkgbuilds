# ROCm rebuild order

Build the ROCm packages in the batches below for each new ROCm release.
Each batch needs the batches above it. "Needs" lists the packages of the
same batch that a step depends on.
The packages in one step do not need each other, so they can build at the
same time.

## Batch 1: compiler and core

| Step | Package | Needs |
|---|---|---|
| 1 | rocm-core | — |
| 2 | rocm-cmake | rocm-core |
| 3 | rocm-llvm, rocprofiler-register | rocm-core, rocm-cmake |
| 4 | hsa-rocr | rocm-llvm, rocprofiler-register |
| 5 | rocminfo | hsa-rocr |
| 6 | hip-runtime | rocm-llvm, rocprofiler-register, rocminfo |

## Batch 2: tools

| Step | Package | Needs |
|---|---|---|
| 1 | rocprof-trace-decoder, hsa-amd-aqlprofile, rocm-dbgapi, rocm-smi-lib, amdsmi, roctracer, rocm-opencl-runtime, hipify-clang, rocjitsu | — |
| 2 | rocprofiler-sdk, rocprofiler, rocr-debug-agent, rocm-gdb, rocshmem | rocprof-trace-decoder, hsa-amd-aqlprofile, rocm-dbgapi, rocm-smi-lib, roctracer, amdsmi |

## Batch 3: primitives

| Step | Package | Needs |
|---|---|---|
| 1 | rocprim, libhipcxx, rocrand | — |
| 2 | hipcub, rocthrust, hipthreads, hiprand | rocprim, libhipcxx, rocrand |

## Batch 4: math libraries

| Step | Package | Needs |
|---|---|---|
| 1 | rocm-openmp, python-tensile, hipblas-common, composable-kernel, rocfft | — |
| 2 | rocblas, hipblaslt, hiptensor, hipfft | python-tensile, hipblas-common, rocm-openmp, composable-kernel, rocfft |
| 3 | rocsparse, rocwmma | rocblas |
| 4 | rocsolver, hipsparse | rocblas, rocsparse |
| 5 | hipsparselt, hipblas, hipsolver, rocalution | hipsparse, rocm-openmp, hipblas-common, rocblas, rocsolver, rocsparse |
| 6 | hipfort | hipblas, hipfft, hipsolver, hipsparse, rocblas, rocfft, rocsolver, rocsparse |

## Batch 5: machine learning and media

| Step | Package | Needs |
|---|---|---|
| 1 | miopen-hip, hipdnn, rccl, rocdecode, rocjpeg | — |
| 2 | rocprofiler-sdk | rccl, rocdecode, rocjpeg |

rocprofiler-sdk takes the API trace headers of rccl, rocdecode and rocjpeg
from makedepends. Build it in batch 2 and again in batch 5, with a new
pkgrel.

## Batch 6: MIGraphX and meta packages

| Step | Package | Needs |
|---|---|---|
| 1 | migraphx, rocm-hip-sdk | — |

## ROCm packages

Rebuilt with each ROCm release:

```
amdsmi
composable-kernel
hip-runtime
hipblas
hipblas-common
hipblaslt
hipcub
hipdnn
hipfft
hipfort
hipify-clang
hiprand
hipsolver
hipsparse
hipsparselt
hiptensor
hipthreads
hsa-amd-aqlprofile
hsa-rocr
libhipcxx
migraphx
miopen-hip
python-tensile
rccl
rocalution
rocblas
rocdecode
rocfft
rocjitsu
rocjpeg
rocm-cmake
rocm-core
rocm-dbgapi
rocm-gdb
rocm-hip-sdk
rocm-llvm
rocm-opencl-runtime
rocm-openmp
rocm-smi-lib
rocminfo
rocprim
rocprof-trace-decoder
rocprofiler
rocprofiler-register
rocprofiler-sdk
rocr-debug-agent
rocrand
rocshmem
rocsolver
rocsparse
rocthrust
roctracer
rocwmma
```

Kept on an older release or versioned separately:

```
mivisionx
rocal
rocm-toolchain
rpp
```

## Third-party packages

Packages outside ROCm that use it:

```
amd-container-toolkit
blender
btop
elfio
ggml
ginkgo-hpc
hiprt
ollama
openimagedenoise
openmpi
openucc
openucx
otf2
python-aotriton
python-cupy
python-pyopencl
python-pytorch
```

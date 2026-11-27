# oneAPI rebuild order

Build the oneAPI packages in the steps below for each new oneAPI release.
Each step needs the steps above it. "Needs" lists the packages that a step
depends on.
The packages in one step do not need each other, so they can build at the
same time.

## Build steps

| Step | Package | Needs |
|---|---|---|
| 1 | intel-oneapi-common | — |
| 2 | intel-oneapi-tcm, intel-oneapi-dev-utilities, intel-oneapi-dpcpp-debugger | intel-oneapi-common |
| 3 | intel-oneapi-tbb, intel-oneapi-umf | intel-oneapi-common, intel-oneapi-tcm |
| 4 | intel-oneapi-openmp | intel-oneapi-common, intel-oneapi-tcm, intel-oneapi-umf |
| 5 | intel-oneapi-compiler-shared-runtime | intel-oneapi-common, intel-oneapi-openmp |
| 6 | intel-oneapi-compiler-shared, intel-oneapi-compiler-dpcpp-cpp-runtime | intel-oneapi-common, intel-oneapi-compiler-shared-runtime, intel-oneapi-dpcpp-debugger, intel-oneapi-openmp, intel-oneapi-tbb, intel-oneapi-umf |
| 7 | intel-oneapi-dpcpp-cpp, intel-oneapi-mkl | intel-oneapi-common, intel-oneapi-compiler-dpcpp-cpp-runtime, intel-oneapi-compiler-shared, intel-oneapi-compiler-shared-runtime, intel-oneapi-dev-utilities, intel-oneapi-openmp, intel-oneapi-tbb |

## oneAPI packages

Rebuilt with each oneAPI release:

```
intel-oneapi-common
intel-oneapi-compiler-dpcpp-cpp-runtime
intel-oneapi-compiler-shared
intel-oneapi-compiler-shared-runtime
intel-oneapi-dev-utilities
intel-oneapi-dpcpp-cpp
intel-oneapi-dpcpp-debugger
intel-oneapi-mkl
intel-oneapi-openmp
intel-oneapi-tbb
intel-oneapi-tcm
intel-oneapi-umf
```

Versioned separately (offline installer, provides the names of all
packages above):

```
intel-oneapi-toolkit
```

## Third-party packages

Packages outside oneAPI that use it:

```
armadillo
blender
ggml
ginkgo-hpc
intel-pti
oneccl
onedpl
python-pytorch
tensorflow
```

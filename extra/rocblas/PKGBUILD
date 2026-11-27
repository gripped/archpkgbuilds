# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Maintainer: Christian Heusel <christian@heusel.eu>
# Contributor: Markus Näther <naether.markus@gmail.com>
# Contributor: Lubosz Sarnecki <lubosz@gmail.com>

pkgname=rocblas
pkgver=10.1
pkgrel=2
pkgdesc='Next generation BLAS implementation for ROCm platform'
arch=('x86_64')
url='https://rocm.docs.amd.com/projects/rocBLAS/en/latest/index.html'
license=('MIT')
depends=(
  'cblas'
  'glibc'
  'hip-runtime-amd'
  'libgcc'
  'openmp'
  'rocm-core'
  'roctracer'
)
makedepends=(
  'amdsmi'
  'cmake'
  'ninja'
  'gcc-fortran'
  # find_package(Git REQUIRED) for the commit ID in the version string
  'git'
  'msgpack-cxx'
  'perl-file-which'
  'python'
  'python-joblib'
  'python-msgpack'
  'python-pyaml'
  'python-tensile'
  'python-wheel'
  'rocm-cmake'
  'rocm-toolchain'
  'rocm-llvm'
  'gtest'
)
optdepends=(
  'python-yaml: for rocblas-bench and rocblas-gemm-tune'
  'gtest: for rocblas-bench and rocblas-gemm-tune'
  'amdsmi: for rocblas-bench and rocblas-gemm-tune'
)
_git='https://github.com/ROCm/rocm-libraries'
source=("$pkgname-$pkgver.tar.gz::$_git/releases/download/therock-$pkgver/$pkgname.tar.gz"
        # Generic GPU targets, https://github.com/ROCm/rocm-libraries/pull/5243
        "rocblas-generic-arch-name.patch::$_git/commit/db802561d56ab4b6303874ccd467c1ec4c5316cf.patch"
        # Commit 1b4a6a629d0f69dfcdeef85af6cf3dbfad6dcd04 of the same pull request,
        # rebased by Fedora, see
        # https://src.fedoraproject.org/rpms/rocblas/tree/6b56d7b0f92f1b66e9d8becc92a61c8214ebc255
        "0006-rocblas-generalize-finding-tensile-for-generics.patch")
sha256sums=('2f75fdc285a80f0e7dfaf807a15288961427c8867141fd39c4dbef0ee6fff802'
            'f1634b0a7b6849cb4df8a62a8b608c91c796d05a9d049c521e737534627403ac'
            '30433bb1d93e05de5a6905dc63b648f15fd7912495e37d2d60efe8ca7c6ab7ca')

prepare() {
  cd $pkgname
  patch -Np3 -i "$srcdir/rocblas-generic-arch-name.patch"
  patch -Np3 -i "$srcdir/0006-rocblas-generalize-finding-tensile-for-generics.patch"
}

build() {
  # Compile source code for supported GPU archs in parallel
  export HIPCC_COMPILE_FLAGS_APPEND="-parallel-jobs=$(nproc)"
  export HIPCC_LINK_FLAGS_APPEND="-parallel-jobs=$(nproc)"

  # Reduce massive spam in log files
  CXXFLAGS+=" -Wno-unused"

  # -fcf-protection is not supported by HIP, see
  # https://rocm.docs.amd.com/projects/llvm-project/en/latest/reference/rocmcc.html#support-status-of-other-clang-options
  local cmake_args=(
    -Wno-dev
    -S "$pkgname"
    -B build
    -G Ninja
    -D CMAKE_BUILD_TYPE=RelWithDebInfo
    -D CMAKE_C_COMPILER=/opt/rocm/lib/llvm/bin/amdclang
    -D CMAKE_CXX_COMPILER=/opt/rocm/lib/llvm/bin/amdclang++
    -D CMAKE_TOOLCHAIN_FILE=toolchain-linux.cmake
    -D CMAKE_CXX_FLAGS="${CXXFLAGS} -fcf-protection=none"
    -D CMAKE_INSTALL_PREFIX=/opt/rocm
    -D amd_comgr_DIR=/opt/rocm/lib/cmake/amd_comgr
    # Enable rocblas-bench and rocblas-gemm-tune
    -D BUILD_CLIENTS_BENCHMARKS=ON
    # The clients default to ILP64 OpenBLAS, which CMake's FindBLAS does not
    # find in Arch. Use LP64 netlib CBLAS and BLAS through pkg-config instead.
    -D ROCBLAS_CLIENTS_REFERENCE_ILP64=OFF
    -D BLA_PREFER_PKGCONFIG=ON
    -D BLA_PKGCONFIG_BLAS=cblas
    -D HIP_PLATFORM=amd
    -D BUILD_WITH_TENSILE=ON
    -D Tensile_LIBRARY_FORMAT=msgpack
    -D Tensile_COMPILER=hipcc
    # Use the installed python-tensile instead of a virtualenv
    -D BUILD_WITH_PIP=OFF
    # hipblaslt doesn't support all relevant targets
    -D BUILD_WITH_HIPBLASLT=OFF
    # gfx9-generic does not cover gfx908 and gfx90a
    -D GPU_TARGETS="$(rocm-supported-gfx);gfx908:xnack-;gfx90a:xnack+;gfx90a:xnack-"
  )
  cmake "${cmake_args[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

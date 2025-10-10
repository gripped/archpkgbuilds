# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Maintainer: Christian Heusel <christian@heusel.eu>
# Contributor: Markus Näther <naether.markus@gmail.com>
# Contributor: Lubosz Sarnecki <lubosz@gmail.com>
pkgname=rocblas
pkgver=6.4.4
pkgrel=1
pkgdesc='Next generation BLAS implementation for ROCm platform'
arch=('x86_64')
url='https://rocm.docs.amd.com/projects/rocBLAS/en/latest/index.html'
license=('MIT')
depends=(
  'cblas'
  'gcc-libs'
  'glibc'
  'hip-runtime-amd'
  'openmp'
  'rocm-core'
  'roctracer'
)
makedepends=(
  'cmake'
  'gcc-fortran'
  'git'
  'msgpack-cxx'
  'perl-file-which'
  'python'
  'python-joblib'
  'python-msgpack'
  'python-pyaml'
  'python-tensile'
  'python-virtualenv'
  'python-wheel'
  'rocm-cmake'
  'rocm-toolchain'
)
_rocblas='https://github.com/ROCm/rocBLAS'
_tensile='https://github.com/ROCm/Tensile'
source=("$pkgname-$pkgver.tar.gz::$_rocblas/archive/refs/tags/rocm-$pkgver.tar.gz"
        "$pkgname-tensile-$pkgver.tar.gz::$_tensile/archive/refs/tags/rocm-$pkgver.tar.gz")
sha256sums=('bc374b57579fa8458132f73d9a152517af63b9f411a2176b72829f4a1d6021c1'
            '48ee6a9b33631625c7613e1fb8872290cb7c70977506c4f8b7ed102f293fdf38')
options=(!strip)
_dirname="$(basename "$_rocblas")-$(basename "${source[0]}" ".tar.gz")"
_tensile_dir="$(basename "$_tensile")-$(basename "${source[1]}" ".tar.gz")"

build() {
  # Compile source code for supported GPU archs in parallel
  export HIPCC_COMPILE_FLAGS_APPEND="-parallel-jobs=$(nproc)"
  export HIPCC_LINK_FLAGS_APPEND="-parallel-jobs=$(nproc)"

  # -fcf-protection is not supported by HIP, see
  # https://rocm.docs.amd.com/projects/llvm-project/en/latest/reference/rocmcc.html#support-status-of-other-clang-options
  local cmake_args=(
    -Wno-dev
    -S "$_dirname"
    -B build
    -D CMAKE_BUILD_TYPE=RelWithDebInfo
    -D CMAKE_C_COMPILER=/opt/rocm/lib/llvm/bin/amdclang
    -D CMAKE_CXX_COMPILER=/opt/rocm/lib/llvm/bin/amdclang++
    -D CMAKE_TOOLCHAIN_FILE=toolchain-linux.cmake
    -D CMAKE_CXX_FLAGS="${CXXFLAGS} -fcf-protection=none"
    -D CMAKE_INSTALL_PREFIX=/opt/rocm
    -D CMAKE_PREFIX_PATH=/opt/rocm/llvm/lib/cmake/llvm
    -D amd_comgr_DIR=/opt/rocm/lib/cmake/amd_comgr
    -D BUILD_FILE_REORG_BACKWARD_COMPATIBILITY=OFF
    -D HIP_PLATFORM=amd
    -D BLAS_LIBRARY=cblas
    -D BUILD_WITH_TENSILE=ON
    -D Tensile_LIBRARY_FORMAT=msgpack
    -D Tensile_TEST_LOCAL_PATH="$srcdir/$_tensile_dir"
    -D Tensile_COMPILER=hipcc
    -D BUILD_WITH_PIP=OFF
    # hipblaslt doesn't support all relevant targets
    -D BUILD_WITH_HIPBLASLT=OFF
    # -D GPU_TARGETS=$(rocm-supported-gfx)
  )
  cmake "${cmake_args[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$_dirname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

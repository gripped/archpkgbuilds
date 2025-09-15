# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

_name=ucc
pkgname=openucc
pkgver=1.5.0
pkgrel=1
pkgdesc="Unified Collective Communication Library"
arch=(x86_64)
url="https://github.com/openucx/ucc"
license=(BSD-3-Clause)
depends=(
  glibc
  openucx
)
makedepends=(
  cuda
  hip-runtime-amd
  nccl
  rccl
  rdma-core
)
checkdepends=(
  gtest
)
optdepends=(
  'cuda: for CUDA execution engine and transport layer'
  'hip-runtime-amd: for HIP execution engine'
  'nccl: for NCCL transport layer'
  'rccl: for RCCL transport layer'
  'rdma-core: for InfiniBand transport layer'
)
provides=(
  libucc.so
)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  fix-wlto-type-mismatch.patch
)
b2sums=('8e7c51d36564a85d1773426a7d90421121e28f8d379c632c50e85edd7ad99c510636d6c9e7410eb5a1d003a59258dec32e645fa77e0b976f671ef0ed009e6dd4'
        '42815c43a99d8b7ac60ee14849c273f4872b2e755a289d996614469b9478c6f131597ddd4b2e4984174de49af1f070e4bdbbcc6c57a0900251c30801d56f23c0')

prepare() {
  cd $_name-$pkgver
  # fix building with gcc 15 (yes ucx bundles its old version of gtest...)
  sed -i '1i\#include <cstdint>' test/gtest/common/gtest-all.cc

  # CL/HIER: Fix Wlto-type-mismatch
  # https://github.com/openucx/ucc/pull/1179
  patch -p1 -i ../fix-wlto-type-mismatch.patch
}

build() {
  local configure_options=(
    --prefix=/usr
    --with-ucx=/usr
    --with-cuda=/opt/cuda
    --with-rocm=/opt/rocm
    --with-rocm-arch=all-arch-no-native
    --enable-gtest
    CFLAGS="$CFLAGS"
    CXXFLAGS="$CXXFLAGS"
    LDFLAGS="$LDFLAGS"
    NVCC_CFLAGS="--threads 0"
    HIPCC="/opt/rocm/lib/llvm/bin/amdclang"
  )

  cd $_name-$pkgver
  ./autogen.sh
  ./configure "${configure_options[@]}"
  # prevent excessive overlinking due to libtool
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make V=1
}

check() {
  # exclude test_mc_rocm.* - we cannot test ROCm without a GPU
  # exclude test_*reduce*:test_bcast_*:test_barrier.*:test_team.*:test_mc.*:test_active_set_2.*:test_scatter*:test_*gather*:*test_alltoall* - UCC ERROR no components supported memory type host available
  # exclude test_context.global due to https://github.com/openucx/ucc/issues/1090
  # exclude test_asymmetric_memory.* and test_asymmetric_memory_v.* and test_active_set.* due to https://github.com/openucx/ucc/issues/1132
  make gtest -C $_name-$pkgver GTEST_FILTER='-test_mc_rocm.*:test_*reduce*:test_bcast_*:test_barrier.*:test_team.*:test_mc.*:test_active_set_2.*:test_scatter*:test_*gather*:*test_alltoall*:test_context.global:test_asymmetric_memory.*:test_asymmetric_memory_v.*:test_active_set.*'
}

package() {
  make DESTDIR="$pkgdir" install -C $_name-$pkgver

  # install the license
  install -vDm 644 $_name-$pkgver/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/

  # remove bundled gtest
  rm "$pkgdir"/usr/bin/gtest
}

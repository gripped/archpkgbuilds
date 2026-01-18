# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

_name=ucc
pkgname=openucc
pkgver=1.6.0
pkgrel=2
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
)
b2sums=('4957c842f1e1b4ba50f37018b1c9dfdcb9ccd4aead78e8685abde790d8e69d67c871cfdefd5fd54a4508c114642b6f303cf7000f7c2cf668771acdcb859c1fa2')

prepare() {
  cd $_name-$pkgver
  # fix building with gcc 15 (yes ucx bundles its old version of gtest...)
  sed -i '1i\#include <cstdint>' test/gtest/common/gtest-all.cc
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

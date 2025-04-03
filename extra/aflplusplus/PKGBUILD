# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor GI Jack <GI_Jack@hackermail.com>

pkgname=afl++
pkgver=4.31c
pkgrel=1
pkgdesc='instrumentation-driven fuzzer for binary format'
url='https://aflplus.plus/'
arch=(x86_64)
license=(Apache-2.0)
depends=(
  bash
  clang
  compiler-rt
  gcc-libs
  glibc
  lld
  llvm
  python
  zlib
)
makedepends=(
  cpio
  git
  grep
  pax-utils
  python-jinja
  python-msgpack
  rust
)
checkdepends=(
  cmocka
)
provides=(
  afl
)
conflicts=(
  afl
  aflplusplus
)
replaces=(
  afl
  aflplusplus
)
source=(
  "https://github.com/AFLplusplus/AFLplusplus/archive/refs/tags/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
)
sha256sums=('8c6e9bef19b3d43020972701553734d1cb435c39a28b253f0dd6668e6ecb86bb')
b2sums=('3c0b8cff5fcc5cdd10d29a98f227d9c9bd5fc16bbc08e8e501b385e1473a0e8347a9e5f81513d499725b23329a4cc3907d611597e14c8b312cfcab4a2116d382')

build() {
  cd "AFLplusplus-${pkgver}"
  export LLVM_LTO=1
  make PREFIX=/usr
}

check() {
  cd "AFLplusplus-${pkgver}"
  # Unset our CFLAGS/CXXFLAGS for the tests since these may
  # interact in unexpected ways with afl-cc instrumentation.
  CFLAGS= CXXFLAGS= make test
}

package() {
  cd "AFLplusplus-${pkgver}"
  make install PREFIX=/usr DESTDIR="${pkgdir}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:

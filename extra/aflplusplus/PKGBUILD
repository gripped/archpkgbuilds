# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor GI Jack <GI_Jack@hackermail.com>

pkgname=afl++
pkgver=4.32c
pkgrel=2
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
sha256sums=('dc7f59a11ce8cf67a3ed09a5ac78028c6f793b239b21fd83e5b2370cea166926')
b2sums=('259edf3fe4405a8703a7452f99406fd390e97763d687445e0a6104f884ba304b3f6755fcdef36f7f8d9743db945ef60791402462cf4599c5a90593ecbb414daf')

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

# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=lib32-expat
_name=${pkgname#lib32-}
pkgver=2.7.1
pkgrel=1
pkgdesc='An XML Parser library'
arch=(x86_64)
url=https://libexpat.github.io/
_url="https://github.com/libexpat/libexpat"
license=(MIT)
depends=(
  "expat=$pkgver"
  lib32-glibc
)
makedepends=(
  cmake
  git
)
provides=(libexpat.so)
source=($_name::git+$_url?signed#tag=R_${pkgver//./_})
sha512sums=('b3e2b93274eed89c4b5e27721892ee12bd1655d561e00e0866c9dd7a6e6c73fd11a6d093b4609aaacf04301733434f5cc724b6339859c7fd98dce500b2778eed')
b2sums=('edac1ab45465cefd442c05559644142ecec084711b01dcfa40cc2ea8beee7eb2d2bd93e323b5065fd8ea46684110d891ac3e937771ac223a51d8d5bbf75f2a0b')
validpgpkeys=(3176EF7DB2367F1FCA4F306B1F9B0E909AF37285) # Sebastian Pipping

build() {
  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_LIBDIR=lib32
    -D CMAKE_INSTALL_PREFIX=/usr
    -S $_name/$_name
    -W no-dev
  )

  export CC='gcc -m32'
  export CXX='c++ -m32'
  export PKG_CONFIG=i686-pc-linux-gnu-pkg-config

  cmake "${cmake_options[@]}"
  cmake --build build --verbose
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -vDm 644 $_name/$_name/COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
  rm -rf "$pkgdir"/usr/{bin,include,share/man,share/doc}
}

# vim:set sw=2 sts=-1 et:

# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

_name=expat
pkgname=lib32-expat
pkgver=2.6.3
pkgrel=1
pkgdesc='An XML Parser library'
arch=(x86_64)
url=https://libexpat.github.io/
license=(MIT)
depends=(
  "expat=$pkgver"
  lib32-glibc
)
makedepends=(cmake)
provides=(libexpat.so)
source=(https://github.com/libexpat/libexpat/releases/download/R_${pkgver//./_}/$_name-$pkgver.tar.bz2{,.asc})
sha512sums=('ee5acbd0cd1df829ef138217a8497254bfe1952efad6311e805c8e6fcfc0133e8d8324da2f5a9734fe71402acec338c256a220420ec49d40f65b0aa28fced9c8'
            'SKIP')
b2sums=('524d8ed0599f51a50f3dd711302c463e024528f871b614c7df4fc6f8567122b1c51024771e859cd796f1be943977c088f733a654c9c5f16c4999788c2231493e'
        'SKIP')
validpgpkeys=(3176EF7DB2367F1FCA4F306B1F9B0E909AF37285) # Sebastian Pipping

build() {
  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_LIBDIR=lib32
    -D CMAKE_INSTALL_PREFIX=/usr
    -S $_name-$pkgver
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
  install -vDm 644 $_name-$pkgver/COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
  rm -rf "$pkgdir"/usr/{bin,include,share/man,share/doc}
}

# vim:set sw=2 sts=-1 et:

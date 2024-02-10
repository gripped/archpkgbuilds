# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

_name=expat
pkgname=lib32-expat
pkgver=2.6.0
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
sha512sums=('116587256c8b5a477e56e2dc5a4d0c3c580b43727dd93685e044057c196779d348ee50adf53dd060c305e06855ad7fe9492f1ad69c175063dfc8babf71c1d032'
            'SKIP')
b2sums=('c823bc6078c8dc2a71c88a5b93cee596d966c83125e267691c4be536da59f73f238ed31326f4fda899ef1c0a268cc798e714012f44853174e05fe7569853628f'
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

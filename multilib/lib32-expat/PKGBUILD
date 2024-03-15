# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

_name=expat
pkgname=lib32-expat
pkgver=2.6.2
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
sha512sums=('15811413e92a632272188781cc3f2a9e52ed62f6edfad9b2eeeca0946e53132b6c9ca6dc460eda766d6a4e68e5920128335d705f9556b5aa3f77593658780470'
            'SKIP')
b2sums=('9b518cf768e53b177fd933d37686a76c4a1bd1e2829cf414f8f9c054901f61d6445232eb4d4502e888507efa12a48d8ace206fbabac5d2ca5365f0437e971fd8'
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

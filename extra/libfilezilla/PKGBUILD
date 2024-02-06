# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Martchus <martchus@gmx.net>

pkgname=libfilezilla
epoch=1
pkgver=0.46.0
pkgrel=1
pkgdesc='Small and modern C++ library, offering some basic functionality to build high-performing, platform-independent programs'
url='https://lib.filezilla-project.org/'
arch=('x86_64')
license=('GPL')
depends=('glibc' 'gcc-libs' 'nettle' 'gnutls' 'libnettle.so' 'libhogweed.so')
makedepends=(clang)
checkdepends=('cppunit')
provides=('libfilezilla.so')
source=(https://download.filezilla-project.org/libfilezilla/libfilezilla-${pkgver}.tar.xz)
sha512sums=('721186993b9af7087033d9acd03ecd70a6a567cd46ded0d26e141ffccba5aed31d5095f3a1d56397280a6f75ad53460c9acbbb3650881e57dccd6f67ccbbf9ba')
b2sums=('9516260054f7b9d0df0cecf41912536c03f824dd7a43cf8eb52ef7690c3f4edb0ba828fb7fe1c016ac3a4db60a9e6b7a7a03cc90de1bac59439c9f989c3eec5d')

build() {
  cd ${pkgname}-${pkgver}
  export CXX=clang++
  export CC=clang
  ./configure \
    --prefix=/usr \
    --disable-static
  make
}

check() {
  cd ${pkgname}-${pkgver}
  # LANG needed to fix string_test::test_conversion2
  LANG=en_US.UTF-8 make check
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:

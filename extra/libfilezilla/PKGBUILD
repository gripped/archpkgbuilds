# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Martchus <martchus@gmx.net>

pkgname=libfilezilla
epoch=1
pkgver=0.51.0
pkgrel=1
pkgdesc="Small and modern C++ library, offering some basic functionality to build high-performing, platform-independent programs"
url="https://lib.filezilla-project.org/"
arch=('x86_64')
license=('GPL-2.0-or-later')
depends=('glibc' 'gcc-libs' 'nettle' 'gnutls' 'libnettle.so' 'libhogweed.so' 'libcrypt.so')
makedepends=('clang')
checkdepends=('cppunit')
provides=('libfilezilla.so')
# Upstream download link became (purposely) unstable
# See https://trac.filezilla-project.org/ticket/13186
#source=("https://download.filezilla-project.org/libfilezilla/libfilezilla-${pkgver}.tar.xz")
source=("https://sources.archlinux.org/other/libfilezilla/${pkgname}-${pkgver}.tar.xz")
sha512sums=('0864c1d6e93f077005223d7a2818ff8711bfed0812bc369b04d2d20c07c1b41908951e5a96d4402407287b350513bf037b4b522a7cdff850071c8e2b045e83b0')
b2sums=('5d99dac0595fbd7c60e4e9c4b6d5992db9966151457f0d7fc93c51063144860adef14b5410c28192cd8ad5298e71f665217bfd418098d217318b52fda7f14383')

build() {
  cd "${pkgname}-${pkgver}"
  export CXX=clang++
  export CC=clang
  ./configure \
    --prefix=/usr \
    --disable-static
  make
}

check() {
  cd "${pkgname}-${pkgver}"
  # LANG needed to fix string_test::test_conversion2
  LANG=en_US.UTF-8 make check
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:

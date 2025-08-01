# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Martchus <martchus@gmx.net>

pkgname=libfilezilla
epoch=1
pkgver=0.51.1
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
sha512sums=('9f686a5be076321a2db8b980d67a31f3c52726ea5d1550d44381c0c18a862056ee6669f5d7f5a67077f9283c04ceba3425c5b087e24d62671af8d68e4568442f')
b2sums=('2c5a3a77f75d86af965a23e671be98fc75dac3b8b91a499a112a5d0d65b591355e8cc78e8b14e7b609f7f5537b88796c5f3d5928d40434fe14f6e6ecc368806b')

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

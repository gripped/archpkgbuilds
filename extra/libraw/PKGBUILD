# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Joeny Ang <ang(dot)joeny(at)gmail(dot)com>
# Contributor: Brad Fanella <bradfanella@archlinux.us>

pkgname=libraw
pkgver=0.21.5
pkgrel=1
pkgdesc='A library for reading RAW files obtained from digital photo cameras (CRW/CR2, NEF, RAF, DNG, and others)'
arch=(x86_64)
url='https://www.libraw.org/'
license=(CDDL-1.0
         LGPL-2.1-only)
depends=(gcc-libs
         glibc
         jasper
         lcms2
         libjpeg-turbo
         zlib)
makedepends=(git)
source=(git+https://github.com/LibRaw/LibRaw#tag=$pkgver)
sha256sums=('94c35b8a7fbf7cecf2a395a13c4de5c6da79c9a71ab7d01c4fbed470f4d7cf98')

prepare() {
  cd LibRaw
  autoreconf -vi
}

build() {
  cd LibRaw
  ./configure --prefix=/usr
  make
}

package() {
  cd LibRaw
  make DESTDIR="$pkgdir" install
}

# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: mgushee

pkgname=djvulibre
pkgver=3.5.30
pkgrel=1
pkgdesc='Library and utilities to create, manipulate and view DjVu (déjà vu) documents'
arch=(x86_64)
url='https://djvu.sourceforge.net/'
license=(GPL-2.0-or-later)
depends=(
  bash
  glibc
  hicolor-icon-theme
  libgcc
  libjpeg-turbo
  libstdc++
  libtiff
)
makedepends=(git)
source=("$pkgname::git+https://git.code.sf.net/p/djvu/djvulibre-git#tag=release.$pkgver")
b2sums=('112a4b597ea497b67cbaf97890e7336ba328824b4e4e544064207928fb5f84ef545af7d086e179a11a01af99d4773416b379811a75ba0fae625876cd09327a6e')

prepare() {
  cd $pkgname
  autoreconf -fiv
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}

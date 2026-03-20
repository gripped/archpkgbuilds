# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Robert Emil Berge <filoktetes@linuxophic.org>
# Contributor: Mateusz Herych <heniekk@gmail.com>

pkgname=gavl
pkgver=2.0.0
pkgrel=1
pkgdesc='Low level library, upon which multimedia APIs can be built'
arch=(x86_64)
url='https://github.com/bplaum/gavl'
license=(GPL-2.0-or-later)
depends=(glibc nettle gnutls libdrm libgl libva)
makedepends=(git doxygen libpng)
source=("git+https://github.com/bplaum/gavl.git#tag=v$pkgver")
b2sums=('da715487e58cc2bc2d2c49579161f964c1d1151bde589b2a1fad8b00c7a1e40fd582ae643c16f20b522ddc7bec6ebeb6254050dfc0278f8b74d1b37b80023b86')

prepare() {
  cd $pkgname
  autoreconf -fi
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --with-cpuflags=none
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}

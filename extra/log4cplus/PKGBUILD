# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Alexey Galakhov <agalakhov at gmail dot com>
# Contributor: Andreas Baumann <abaumann at yahoo dot com>

pkgname=log4cplus
pkgver=2.1.2
pkgrel=1
pkgdesc="A C++ logger very close to Java's log4j"
arch=('x86_64')
url="http://log4cplus.sourceforge.net/"
license=('GPL')
depends=('gcc-libs')
source=("https://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha512sums=('d6285e4964e8eda072b61e0585d5fe08c1d942b688752baf75ba230d49691070156ab4da1803d82d0c09128bcb87e21910e38ee9441df13ff762d527fe431444')

build() {
  cd ${pkgname}-${pkgver}

  ./configure \
    --prefix=/usr \
    --with-working-locale

  make
}

package() {
  cd ${pkgname}-${pkgver}

  make install DESTDIR="${pkgdir}"
}

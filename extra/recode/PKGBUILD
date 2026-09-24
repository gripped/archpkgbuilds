# Maintainer: Kevin Piche <kevin@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=recode
pkgver=3.7.16
pkgrel=1
pkgdesc='Converts files between various character sets and usages'
arch=('x86_64')
url='https://github.com/rrthomas/recode'
license=('GPL-3.0-or-later' 'LGPL-3.0-or-later')
depends=('glibc')
makedepends=('python' 'help2man')
source=("https://github.com/rrthomas/recode/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c3d407f54f74bae76360312096e2ed46622f01c86e50b09ef45b2d93c8fcff2d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --mandir=/usr/share/man \
    --infodir=/usr/share/info \
    --without-included-gettext
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}

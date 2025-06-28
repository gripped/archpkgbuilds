# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Dan Serban
# Contributor: Ross Melin <rdmelin@gmail.com>

pkgname=libfaketime
pkgver=0.9.12
pkgrel=1
pkgdesc='Report fake dates and times to programs without having to change the system-wide time.'
arch=('x86_64')
url='https://github.com/wolfcw/libfaketime'
license=('GPL2')
source=("https://github.com/wolfcw/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('4fc32218697c052adcdc5ee395581f2554ca56d086ac817ced2be0d6f1f8a9fa')
options=(!lto)

build() {
  cd "${pkgname}-${pkgver}"
  make PREFIX=/usr
}

package() {
  cd "${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
}

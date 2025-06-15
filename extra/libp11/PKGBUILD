# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: kevku <kevku@msn.com>
# Contributor: Rene Pärts <rene87@hot.ee>

pkgname=libp11
pkgver=0.4.15
pkgrel=1
pkgdesc="A library implementing a small layer on top of the PKCS11 API"
arch=('x86_64')
url="https://github.com/OpenSC/libp11/wiki"
license=('LGPL-2.1-or-later')
depends=('openssl')
source=("https://github.com/OpenSC/${pkgname}/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz"{,.asc})
sha256sums=('4867d9048f984a08e218f9946526b4dc70bc3921793f7b26685f8e00b1146a08'
            'SKIP')
validpgpkeys=('AC915EA30645D9D3D4DAE4FEB1048932DD3AAAA3')

build() {
  cd "$pkgname-$pkgver"
  autoreconf -f
  automake
  ./configure --prefix=/usr --disable-static
  make
}

check() {
  cd "$pkgname-$pkgver"
  make check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

pkgname=libfabric
pkgver=2.5.1
pkgrel=1
pkgdesc="User-space API for OpenFabrics Interfaces (OFI)"
arch=(x86_64)
url="https://ofiwg.github.io/libfabric/"
license=('BSD-2-Clause OR GPL-2.0-or-later')
depends=(glibc numactl)
options=(!lto)
source=(https://github.com/ofiwg/libfabric/releases/download/v${pkgver}/libfabric-${pkgver}.tar.bz2)
sha512sums=('67c448a1143ebd5ab306e14b177800ef3950f2c40e0ecb2c3329a129b741b84051e70eceee7bf45609e1337fbcc4a687c6add08c4b4f2811774db0f02531267a')

prepare() {
  cd ${pkgname}-${pkgver}
  autoreconf -fvi
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd ${pkgname}-${pkgver}
  make test
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -vDm 644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
}

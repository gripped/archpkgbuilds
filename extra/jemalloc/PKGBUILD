# Maintainer:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Kovivchak Evgen <oneonfire@gmail.com>

pkgname=jemalloc
epoch=1
pkgver=5.3.1
pkgrel=2
pkgdesc='General-purpose scalable concurrent malloc implementation'
arch=('x86_64')
license=('BSD-2-Clause')
url='https://jemalloc.net/'
depends=('glibc' 'libgcc' 'libgcc_s.so' 'libstdc++' 'libstdc++.so')
optdepends=('perl: for jeprof')
provides=('libjemalloc.so')
source=("https://github.com/jemalloc/jemalloc/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('3826bc80232f22ed5c4662f3034f799ca316e819103bdc7bb99018a421706f92')

build() {
  cd $pkgname-$pkgver

  ./configure \
    --enable-prof \
    --enable-autogen \
    --disable-static \
    --prefix=/usr
  make
}

check() {
  make -C $pkgname-$pkgver check
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install

  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
}

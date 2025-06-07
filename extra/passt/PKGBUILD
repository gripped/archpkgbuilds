# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Christian Heusel <christian@heusel.eu>

pkgname=passt
pkgver=2025_06_06.754c6d7
pkgrel=1
pkgdesc="Plug A Simple Socket Transport"
arch=(x86_64)
url="https://passt.top/passt/about/"
license=(
  BSD-3-Clause
  GPL-2.0-or-later
)
depends=(glibc)
optdepends=(
  'sh: for demo script'
)
source=(https://passt.top/$pkgname/snapshot/$pkgname-$pkgver.tar.zst)
sha512sums=('0870b687bdfc30b15d2fdc57d41ad17caca25ceb1fc6ac6d29c6ef4e492be69df439b09089f0e39abfe520f3b8cb9e8d97f7a09d549cdb8a0998effc1f9406b0')
b2sums=('d8568ea94e691bea25ce446fcac692526501982ccbaeec7dd0e1139bdeb02a1553dfc135ddbb55e0372e3c9d2f96b454eddba7c346c7342c32b90a5a1b29e340')

build() {
  make VERSION="$pkgver" -C $pkgname-$pkgver
}

package() {
  make DESTDIR="$pkgdir/" prefix=/usr install -C $pkgname-$pkgver
  install -vDm 644 $pkgname-$pkgver/LICENSES/* -t "$pkgdir/usr/share/licenses/$pkgname/"
}

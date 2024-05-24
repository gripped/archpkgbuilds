# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=passt
pkgver=2024_05_23.765eb0b
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
sha512sums=('05bbd99bdff2a69165b596fce01b8d8d8f1bc5c681c60149beca1ec6d04109db0e2ab9a27a6849107ad6cdd76f4366e773807d436d64f3fc751cab1d6dc79a5e')
b2sums=('a52689401df31f514c2813347e8b0c0e0c6ea36d4e0722000fe68be8f45e5e9da256e547b21fafa9bcaceee96658729b1b20c8259f80f7d93633e88591fcd505')

build() {
  make VERSION="$pkgver" -C $pkgname-$pkgver
}

package() {
  make DESTDIR="$pkgdir/" prefix=/usr install -C $pkgname-$pkgver
  install -vDm 644 $pkgname-$pkgver/LICENSES/* -t "$pkgdir/usr/share/licenses/$pkgname/"
}

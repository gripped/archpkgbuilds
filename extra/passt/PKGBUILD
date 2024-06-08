# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=passt
pkgver=2024_06_07.8a83b53
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
sha512sums=('9c31a5ea55913bae61ab2e82cb50dd0fdebe1f3864237b398bf52b39c45fd48036928eb77db3fbea448da3b84f225db9e4552e15c8e0c57ae9f040b77330544b')
b2sums=('7df80f6aa342a8faf9669127d9955fcfb4a77e3fe6f2e8f029fd9c97f0b66c3790e41992fe196da868ea630557c1c8d1936818070dc85588f244b7e783c8d7cd')

build() {
  make VERSION="$pkgver" -C $pkgname-$pkgver
}

package() {
  make DESTDIR="$pkgdir/" prefix=/usr install -C $pkgname-$pkgver
  install -vDm 644 $pkgname-$pkgver/LICENSES/* -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Christian Heusel <christian@heusel.eu>

pkgname=passt
pkgver=2026_07_28.f8df3f1
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
sha512sums=('72810018b99434949cf8d90307fb64f322c5c9ecc244522ad7389e9af2afdf8bdfb4cf1c38802902fccb7dfe66fdf333d94b7595c31bd5a7a39c512efd5b66fa')
b2sums=('972ebb271de6c462b85d8aae9996c8b9ecc4f6b5a8a8a4699f732ff7d06b1a47e6358e600181257c932ca99d492eb0235938d9ff51b6186dbed464f3523e4607')

build() {
  make VERSION="$pkgver" -C $pkgname-$pkgver
}

package() {
  make DESTDIR="$pkgdir/" prefix=/usr install -C $pkgname-$pkgver
  install -vDm 644 $pkgname-$pkgver/LICENSES/* -t "$pkgdir/usr/share/licenses/$pkgname/"
}

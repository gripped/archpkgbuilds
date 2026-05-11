# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Christian Heusel <christian@heusel.eu>

pkgname=passt
pkgver=2026_05_07.1afd4ed
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
sha512sums=('f0c03b77c428fccdb0c91e8e53aa9db7502f6aefe288fb3391f1a182fe4a6990f7d9efcf929e898307d3502abe574c342925dca9437456e47150429fb5071c97')
b2sums=('139299603933fc2a5e917c1bc0d7c0ddbaf6e106ad95f2111329e37bb6999377973defedb4e606154a0ed5c09b71a676f6eb2392287a6433278ab8ff66210f82')

build() {
  make VERSION="$pkgver" -C $pkgname-$pkgver
}

package() {
  make DESTDIR="$pkgdir/" prefix=/usr install -C $pkgname-$pkgver
  install -vDm 644 $pkgname-$pkgver/LICENSES/* -t "$pkgdir/usr/share/licenses/$pkgname/"
}

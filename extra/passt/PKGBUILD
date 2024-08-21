# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=passt
pkgver=2024_08_21.1d6142f
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
sha512sums=('8bd1d92e0bb5a4cfee91aeb38ef1fac6450d945d994b8435309eb59cfc90719a241e885694324191b96f1bc0767e1c78415e266907ce8ab5ec392af84b816d84')
b2sums=('aab07d5728a65ff65024b0c79c4c99a6f077cb577267edba7f8afcd226a09700ee49158275a99bd561a87a5c52a1cdcf5b506d15b1b832e9498b8fe60b21fcc7')

build() {
  make VERSION="$pkgver" -C $pkgname-$pkgver
}

package() {
  make DESTDIR="$pkgdir/" prefix=/usr install -C $pkgname-$pkgver
  install -vDm 644 $pkgname-$pkgver/LICENSES/* -t "$pkgdir/usr/share/licenses/$pkgname/"
}

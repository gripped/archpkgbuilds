# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=passt
pkgver=2024_03_26.4988e2b
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
sha512sums=('ad3a3cdf9ba9fea843223ef84e3858541dc100bf4dc92dc9876508c801f5160722531724cd79d20f62c40bdb6b2adce980fc40461c388008536d4a08578f5cf3')
b2sums=('689205859942880085e76d87bb33d471bc26cc739c371624845fc7e46ec0e2a4d271b1b7dbeabaebb7b8bd82be47d0e56cb717cc8f57cde63f5e2998c607a1c2')

build() {
  make VERSION="$pkgver" -C $pkgname-$pkgver
}

package() {
  make DESTDIR="$pkgdir/" prefix=/usr install -C $pkgname-$pkgver
  install -vDm 644 $pkgname-$pkgver/LICENSES/* -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=passt
pkgver=2024_10_30.ee7d0b6
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
sha512sums=('8473dc93e3e892936b0255daafec4195480d1672cff8f82207aff7867bd47cc4101c79fdc32e064236139fbb69e4223b49e54a0beb82039c3de930ce58271d16')
b2sums=('0e710144497fdfc599a50279391c01c41410ec8e47d74d80bd82d28076f001c40241158fba0b490dc7b5c0570dbae1aa412030d4aace71fd39d706d4d2363822')

build() {
  make VERSION="$pkgver" -C $pkgname-$pkgver
}

package() {
  make DESTDIR="$pkgdir/" prefix=/usr install -C $pkgname-$pkgver
  install -vDm 644 $pkgname-$pkgver/LICENSES/* -t "$pkgdir/usr/share/licenses/$pkgname/"
}

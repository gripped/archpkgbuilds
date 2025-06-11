# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Christian Heusel <christian@heusel.eu>

pkgname=passt
pkgver=2025_06_11.0293c6f
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
sha512sums=('573386775bf8380264f1f91e6c1154d7b61f3e37fd40fe092bc7b0e6aa95921ad4173c0aed854d1db3c0dfbeca81b9dd4fd87bbaa09746c122a9934ebe153447')
b2sums=('2a754ae172b5a76d5c501573a5d71ce03e5e806e3d9919efb00c1b5736b84f5f804d6e60f4cd1590c4c1e751cc490ec4160f45c050102e7c88efb9f8e2373dbe')

build() {
  make VERSION="$pkgver" -C $pkgname-$pkgver
}

package() {
  make DESTDIR="$pkgdir/" prefix=/usr install -C $pkgname-$pkgver
  install -vDm 644 $pkgname-$pkgver/LICENSES/* -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Christian Heusel <christian@heusel.eu>

pkgname=passt
pkgver=2026_05_26.038c51e
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
sha512sums=('3dec3a47a5b850c6f7b42732e24920e61538a4e2601e8397a351a2744550113633a2eec6fdd3bff67022e3537091797d107bf3352b955eba95828df30fbe2f59')
b2sums=('97a93881f54bc6e9c1df8a56fdaa816af82adaee49247aea37acf3e33d847e000f88868dc41edf3f79e9521180888d4a9c72654cde828e35d9fa438a17f31012')

build() {
  make VERSION="$pkgver" -C $pkgname-$pkgver
}

package() {
  make DESTDIR="$pkgdir/" prefix=/usr install -C $pkgname-$pkgver
  install -vDm 644 $pkgname-$pkgver/LICENSES/* -t "$pkgdir/usr/share/licenses/$pkgname/"
}

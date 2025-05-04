# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Christian Heusel <christian@heusel.eu>

pkgname=passt
pkgver=2025_05_03.587980c
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
sha512sums=('cf257972b60c58ed3a7ca8b0f3af0288dd3c2af753ed6e83068f82c2c54d1970a5966cd96c63eed00d37a42b75441ac6ff80ec5a8c2629eb50a19b48fa3b543e')
b2sums=('664f3cb8250d681c692998d0b0473de90cfc9183648ca574186c3209989cfccdee65e96b55e2cb07121ba977421a78576df9e5c4e8d13606a1a2ff9cd6103c44')

build() {
  make VERSION="$pkgver" -C $pkgname-$pkgver
}

package() {
  make DESTDIR="$pkgdir/" prefix=/usr install -C $pkgname-$pkgver
  install -vDm 644 $pkgname-$pkgver/LICENSES/* -t "$pkgdir/usr/share/licenses/$pkgname/"
}

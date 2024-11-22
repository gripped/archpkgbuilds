# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=passt
pkgver=2024_11_21.238c69f
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
sha512sums=('a7bfe14cadd9fcf58901c645ea37e90940dd62af2980a9718d999ccf32c87f0728a18a2d3f4b12240244105b2b09533cc7bd5a1776d77826ee515b966b1d7458')
b2sums=('f2d800b443f959e089e69ed685875e8e6d7fe5935a29dff404626c22d5873f00f73278831a4785decaad85df53ede1ca9209a012fa2e07cbc3525bfb28154bb1')

build() {
  make VERSION="$pkgver" -C $pkgname-$pkgver
}

package() {
  make DESTDIR="$pkgdir/" prefix=/usr install -C $pkgname-$pkgver
  install -vDm 644 $pkgname-$pkgver/LICENSES/* -t "$pkgdir/usr/share/licenses/$pkgname/"
}

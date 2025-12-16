# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Christian Heusel <christian@heusel.eu>

pkgname=passt
pkgver=2025_12_15.b40f5cd
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
sha512sums=('9c114488840deb8655a581e894b0606d45db474795c33f806643c8d5d395e434d5f0d511f229c486b325ccb71a35e78d9caaedff24ae78a56d674a7ae5ce6217')
b2sums=('0fdab22a1350e7c130af5abb6404929f363c1a093b72f4a856cf77ac1d71704ff92c86795643fd0d496e8efc3de28b0fa4e1f0b820db0ba84f0db059a9650f53')

build() {
  make VERSION="$pkgver" -C $pkgname-$pkgver
}

package() {
  make DESTDIR="$pkgdir/" prefix=/usr install -C $pkgname-$pkgver
  install -vDm 644 $pkgname-$pkgver/LICENSES/* -t "$pkgdir/usr/share/licenses/$pkgname/"
}

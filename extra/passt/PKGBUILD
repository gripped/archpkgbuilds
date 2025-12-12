# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Christian Heusel <christian@heusel.eu>

pkgname=passt
pkgver=2025_12_10.d04c480
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
sha512sums=('958be1e4a126550bd27a98107ed6793d31bbad1e44a5cadcd5eb48633aa5b4aeed3a25bd7bf6f1b274953b9a8cf760e9f83cc9d0b956450b656cad3de91bc260')
b2sums=('77a64c059b8a85aaa5bbd00eba4d45142e906cefc14fdef65498e5aa6d3cac5c3d137921fa0af1b6da32e206d8ccb4ce0fa97855edc366fb0859ec8bc6daa8c7')

build() {
  make VERSION="$pkgver" -C $pkgname-$pkgver
}

package() {
  make DESTDIR="$pkgdir/" prefix=/usr install -C $pkgname-$pkgver
  install -vDm 644 $pkgname-$pkgver/LICENSES/* -t "$pkgdir/usr/share/licenses/$pkgname/"
}

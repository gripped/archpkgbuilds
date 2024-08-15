# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=passt
pkgver=2024_08_14.61c0b0d
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
sha512sums=('eca04e1b87ad82ca8220a0c1f2b3879b9e240efc64f96136f856a76e8db3a8eee5b3029243fdf2ee8e80135d497c5c97d27a8c6b1bc817ef9ef222863d2ff0ca')
b2sums=('2405c56aaebb1a15afee028499fab7c6d6ba9625ef68b807d9188065ae6a1d1fd24d6614aa4d7745087f5fd1b5dfc6fe575043481e8ab20392b178bce9439630')

build() {
  make VERSION="$pkgver" -C $pkgname-$pkgver
}

package() {
  make DESTDIR="$pkgdir/" prefix=/usr install -C $pkgname-$pkgver
  install -vDm 644 $pkgname-$pkgver/LICENSES/* -t "$pkgdir/usr/share/licenses/$pkgname/"
}

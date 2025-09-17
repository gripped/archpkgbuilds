# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Christian Heusel <christian@heusel.eu>

pkgname=passt
pkgver=2025_09_11.6cbcccc
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
sha512sums=('2a4483e9aa16090b61660849f15bb3d7e54d84a9c7d519e5e458bc6ca050c8c76e2cb0d45e42869e6129a257e10e901293494148112851ec3f1f7d95d6270301')
b2sums=('2a199698e8945a7a4acabd5c051b47d669b926b9b7a6847fdb77f68a8bba446c1f8c7960924b228cf488d7dddbe985fa4e838c180bddd0dcefa29d760d297957')

build() {
  make VERSION="$pkgver" -C $pkgname-$pkgver
}

package() {
  make DESTDIR="$pkgdir/" prefix=/usr install -C $pkgname-$pkgver
  install -vDm 644 $pkgname-$pkgver/LICENSES/* -t "$pkgdir/usr/share/licenses/$pkgname/"
}

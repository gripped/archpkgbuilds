# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=passt
pkgver=2024_04_05.954589b
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
sha512sums=('68743a145ddf1fcab2cdd3e76545ec9c8e68c1002f259de9cf345673584d0a5be9c47b26504956eab917772baaeb19b57ce8142d0cce4c5751f23f2a1d5f9a2e')
b2sums=('01b6b7c1f169664dd4a7f6e6c17baa88abc9dad8e0e643baeb7dc3580941ae4c2ea78147a5accbdfdb1f76417d78a77560f8589be13c8919771fcb40a982e6f3')

build() {
  make VERSION="$pkgver" -C $pkgname-$pkgver
}

package() {
  make DESTDIR="$pkgdir/" prefix=/usr install -C $pkgname-$pkgver
  install -vDm 644 $pkgname-$pkgver/LICENSES/* -t "$pkgdir/usr/share/licenses/$pkgname/"
}

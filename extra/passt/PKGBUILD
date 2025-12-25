# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Christian Heusel <christian@heusel.eu>

pkgname=passt
pkgver=2025_12_23.2ba9fd5
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
sha512sums=('929617028c27298ce357ca74cf36f672e0fed8eadeee3c4cb11e06a97048c05e4fc0fbc598dfe086eb298997b959f8adff110712bbecca2e433a5a88c1a64821')
b2sums=('4f9f6d9d6c0210b2a58cc98ee4a188dac830fc0fa8cbcfd8d27bd9a77f4843f5bdfb3de9bb5c2f20c85e7489ddd894369ea1f7c4f1d070110af2b646c9c13176')

build() {
  make VERSION="$pkgver" -C $pkgname-$pkgver
}

package() {
  make DESTDIR="$pkgdir/" prefix=/usr install -C $pkgname-$pkgver
  install -vDm 644 $pkgname-$pkgver/LICENSES/* -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Christian Heusel <christian@heusel.eu>

pkgname=passt
pkgver=2026_09_25.df90211
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
sha512sums=('9a7d4badcb6f7a45c4d0d8c39a32378ee403461536c52a96397bc11733dd6d32257653a213e5d095850813d272d92d7c37180e649ade9b66bf13243a7595b101')
b2sums=('0ae1d0de21ad672c22fc278fe5219f00805e9951f02955e928d56e7a5f630471067b0a55ed802ab8c7acfdccf263aea9a1d4e08eb77351c8af35ead3e48363a3')

build() {
  make VERSION="$pkgver" -C $pkgname-$pkgver
}

package() {
  make DESTDIR="$pkgdir/" prefix=/usr install -C $pkgname-$pkgver
  install -vDm 644 $pkgname-$pkgver/LICENSES/* -t "$pkgdir/usr/share/licenses/$pkgname/"
}

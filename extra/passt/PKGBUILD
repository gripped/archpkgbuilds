# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Christian Heusel <christian@heusel.eu>

pkgname=passt
pkgver=2026_06_11.a9c61ff
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
sha512sums=('784451f414185e2efe64cf1e0e620fb4f80cc809c8035c69ed0d12faf439e351c3b025c0d8b8988bced1112c37f80d9533bb97d8f9ee11de5c979b6a235cce85')
b2sums=('e803fe4efc2c5f8ac5a8699bb6983c33d8760ecc9eea01eca3f463a9916e4b55dc072ea6793941c244828a43434c20236940afc706ecd6c7f03aea09af0b0afb')

build() {
  make VERSION="$pkgver" -C $pkgname-$pkgver
}

package() {
  make DESTDIR="$pkgdir/" prefix=/usr install -C $pkgname-$pkgver
  install -vDm 644 $pkgname-$pkgver/LICENSES/* -t "$pkgdir/usr/share/licenses/$pkgname/"
}

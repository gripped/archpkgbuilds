# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgbase=snowball
pkgname=(
  snowball
  libstemmer
)
pkgver=3.2.0
pkgrel=1
pkgdesc="String processing language for creating stemming algorithms"
url="https://snowballstem.org/"
arch=(x86_64)
license=(BSD-3-Clause)
depends=(glibc)
makedepends=(git)
source=(
  "git+https://github.com/snowballstem/snowball#tag=v$pkgver"
  0001-Make-libstemmer-a-shared-library.patch
)
b2sums=('8437d30db79957e9ca9b6a2340ee3f83865ee00813ffd1c5bbebbb3950d9fe547f192c831481c310f43fd3166f43e5e17af8bafeef76310abc34cfe788838a94'
        'e40f4913cc48ff1e1c671bfe36044a88c02d3be3a6a1adb5004ee6f6afd7a526570d297eff944768f9d92a818055a7a5df3fc6a6dc2267078ec1bcedcddb5766')

prepare() {
  cd snowball
  git apply -3 ../0001-Make-libstemmer-a-shared-library.patch
}

build() {
  cd snowball
  make
}

# No check - needs external test data

package_snowball() {
  depends+=(libstemmer)

  cd snowball

  install -D snowball stemwords -t "$pkgdir/usr/bin"

  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_libstemmer() {
  pkgdesc="Stemming library supporting several languages"
  provides=(libstemmer.so)

  cd snowball

  install -Dm644 include/libstemmer.h -t "$pkgdir/usr/include"

  install -Dm644 libstemmer.so.0 "$pkgdir/usr/lib/libstemmer.so.0.0.0"
  ln -s libstemmer.so.0.0.0 "$pkgdir/usr/lib/libstemmer.so.0"
  ln -s libstemmer.so.0 "$pkgdir/usr/lib/libstemmer.so"

  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set sw=2 sts=-1 et:

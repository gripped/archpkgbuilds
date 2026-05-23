# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgbase=snowball
pkgname=(
  snowball
  libstemmer
)
pkgver=3.1.0
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
b2sums=('b17375094dc2cc8424948315c0f397eea4f4d75f6e53995eff891ab12df8e9a62cde8f7a5e09091f2b78561122d3ad112fc551b0d77442c78b5972f3d8acd612'
        'f9d399eb8d903adcccfca750faaefed62d75bf4429c5cd18c6d09906b69f8b1cf2821a446aca437a17f9b930b621f0c7c3563e64c0ef13b713f9c27e4b260123')

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

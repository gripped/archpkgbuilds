# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=nauty
epoch=1
pkgver=2.8.9
pkgrel=2
pkgdesc='A program for computing automorphism groups of graphs and digraphs'
arch=(x86_64)
url='http://pallini.di.uniroma1.it/'
license=(Apache-2.0)
depends=(glibc)
source=(http://pallini.di.uniroma1.it/nauty${pkgver//./_}.tar.gz)
sha256sums=('9ac46554c5bb7ecd99601f3c8b4d7857b178059b3eb3a58676ccfdb9d959f403')
 
build() {
  cd nauty${pkgver//./_}

# Workaround build system discarding LDFLAGS
  CFLAGS="$CFLAGS $LDFLAGS" \
  ./configure \
    --prefix=/usr \
    --includedir=/usr/include/nauty \
    --enable-generic
  make
}

package() {
  cd nauty${pkgver//./_}

  make DESTDIR="$pkgdir" install
  mkdir -p "$pkgdir"/usr/share/licenses/nauty
  install COPYRIGHT "$pkgdir"/usr/share/licenses/nauty/LICENSE
}

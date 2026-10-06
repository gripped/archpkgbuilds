# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=libqalculate
pkgver=5.13.1
pkgrel=1
pkgdesc='Multi-purpose desktop calculator'
arch=(x86_64)
url='https://qalculate.github.io/'
license=(GPL-2.0-only)
depends=(curl
         icu
         glibc
         gmp
         libgcc
         libstdc++
         libxml2
         mpfr
         readline)
makedepends=(doxygen
             git
             intltool)
optdepends=('gnuplot: for plotting support')
source=(git+https://github.com/Qalculate/libqalculate#tag=v$pkgver)
sha256sums=('5cc56d3767bdd90db66cb2e600f5df8360fcc911be828e2567ce31f5170386bf')

prepare() {
  cd $pkgname
  ./autogen.sh
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}

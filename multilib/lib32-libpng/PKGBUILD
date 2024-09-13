# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Travis Willard <travis@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

_pkgbasename=libpng
pkgname=lib32-$_pkgbasename
pkgver=1.6.44
_libversion=16
pkgrel=1
pkgdesc='A collection of routines used to create PNG format graphics files (32-bit)'
arch=('x86_64')
url='http://www.libpng.org/pub/png/libpng.html'
license=('custom')
depends=('lib32-zlib' $_pkgbasename)
makedepends=('git')
provides=('libpng16.so')
source=("git+https://github.com/pnggroup/libpng.git?signed#tag=v${pkgver}")
sha256sums=('56d285e5bdc6a7ef5a46b987d62fc88b199cfdf1cb1dad19df10b361ef6613ce')
validpgpkeys=('F57A55036A4D45837074FD92C9E384533403C2F8') # Cosmin Truta

prepare() {
  cd libpng
  autoreconf -fiv
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG="i686-pc-linux-gnu-pkg-config"

  cd libpng

  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --program-suffix=-32 \
    --disable-static
  make
}

package() {
  cd libpng

  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share}

  rm "$pkgdir/usr/bin/libpng-config"
  ln -s "libpng${_libversion}-config-32" "$pkgdir/usr/bin/libpng-config-32"

  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}

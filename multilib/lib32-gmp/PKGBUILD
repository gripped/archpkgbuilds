# Maintainer: Florian Pritz <bluewind@xinu.at>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

_pkgbasename=gmp
pkgname=lib32-$_pkgbasename
pkgver=6.3.0
pkgrel=1
pkgdesc="A free library for arbitrary precision arithmetic (32-bit)"
arch=('x86_64')
url="https://gmplib.org/"
depends=('lib32-gcc-libs' $_pkgbasename)
makedepends=(gcc-multilib)
license=('LGPL3' 'GPL')
source=(https://gmplib.org/download/gmp/gmp-${pkgver}.tar.xz{,.sig})
sha512sums=('e85a0dab5195889948a3462189f0e0598d331d3457612e2d3350799dba2e244316d256f8161df5219538eb003e4b5343f989aaa00f96321559063ed8c8f29fd2'
            'SKIP')
validpgpkeys=('343C2FF0FBEE5EC2EDBEF399F3599FF828C67298') # Niels Möller

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "${_pkgbasename}-${pkgver}"

  export ABI=32
  ./configure \
    --prefix=/usr --infodir=/usr/share/info \
    --enable-fat --enable-cxx --libdir=/usr/lib32 \
    --includedir=/usr/lib32/gmp

  #Put gmp.h in the same folder as gmpxx.h
  sed -i 's/$(exec_prefix)\/include/$\(includedir\)/' Makefile

  make
}

check() {
  cd "${_pkgbasename}-${pkgver}"
  make check
}

package() {
  cd "${_pkgbasename}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share,bin}
}

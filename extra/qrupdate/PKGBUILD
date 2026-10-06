# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Marco Maso <demind@gmail.com>
# Contributor: Adrian Benson <adrian_benson@yahoo.co.nz>

pkgname=qrupdate
pkgver=1.3.0
pkgrel=1
pkgdesc='Fortran library for fast updates of QR and Cholesky decompositions'
url='https://sourceforge.net/projects/qrupdate'
depends=(blas
         glibc
         lapack
         libgcc
         libgfortran)
makedepends=(cmake
             gcc-fortran
             git)
arch=(x86_64)
license=(GPL-3.0-or-later)
source=(git+https://github.com/mpimd-csc/qrupdate-ng#tag=v$pkgver)
sha256sums=('04fe87f7daf85e9dd1f753f7fa18f8cf2ae13eb6291471c41337c93b1831a253')

build() {
  cmake -B build -S $pkgname-ng \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build --verbose
}

check() {
  cmake --build build --target test
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

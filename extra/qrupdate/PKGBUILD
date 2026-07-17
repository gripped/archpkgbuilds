# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Marco Maso <demind@gmail.com>
# Contributor: Adrian Benson <adrian_benson@yahoo.co.nz>

pkgname=qrupdate
pkgver=1.2.0
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
sha256sums=('f05adf7962472352567b01ee5070199004400d978120d5f61760d3a708c5956c')

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

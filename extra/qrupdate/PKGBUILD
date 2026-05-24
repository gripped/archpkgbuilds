# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Marco Maso <demind@gmail.com>
# Contributor: Adrian Benson <adrian_benson@yahoo.co.nz>

pkgname=qrupdate
pkgver=1.1.5
pkgrel=3
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
sha256sums=('d9bbba56747aef0da896fa2ae5ff670e7eecfba49857681a8a242af1bcd6e7d9')

build() {
  cmake -B build -S $pkgname-ng \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
  cmake --build build --verbose
}

check() {
  cmake --build build --target test
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

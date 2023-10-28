# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>

pkgname=suitesparse
pkgver=7.3.0
pkgrel=1
pkgdesc='A collection of sparse matrix libraries'
url='http://faculty.cse.tamu.edu/davis/suitesparse.html'
arch=(x86_64)
depends=(blas
         gcc-libs
         glibc
         gmp
         lapack
         mpfr)
makedepends=(cmake
             gcc-fortran)
replaces=('suitesparse64<7.1.0')
license=(GPL)
source=(https://github.com/DrTimothyAldenDavis/SuiteSparse/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('ea290a04bd0c3dbbefe9a869a42644fc1bb61f9451040d8d88896a9df13ee620')

build() {
  cd SuiteSparse-$pkgver
  CMAKE_OPTIONS="-DBLA_VENDOR=Generic \
                 -DCMAKE_INSTALL_PREFIX=/usr \
                 -DCMAKE_BUILD_TYPE=None \
                 -DNSTATIC=ON" \
  make
}

package() {
  cd SuiteSparse-$pkgver
  DESTDIR="$pkgdir" make install
}

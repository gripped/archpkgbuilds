# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Elmar Klausmeier <Elmar.Klausmeier@gmail.com>

pkgname=sundials
pkgver=7.2.0
pkgrel=1
pkgdesc='Suite of nonlinear differential/algebraic equation solvers'
arch=(x86_64)
url='https://computing.llnl.gov/projects/sundials'
license=(BSD-3-Clause)
depends=(gcc-libs
         glibc
         openmpi
         suitesparse)
makedepends=(cmake
             gcc-fortran
             git
             python)
optdepends=('python-matplotlib: for some examples'
            'python-numpy: for some examples')
source=(git+https://github.com/LLNL/sundials#tag=v$pkgver)
sha256sums=('95c9fca8c9fdf67699ed5f3d842cbd0625cb774d8992d80c5d4e01448c9108d6')

build() {
  cmake -B build -S $pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_STATIC_LIBS=OFF \
    -DENABLE_MPI=ON \
    -DENABLE_PTHREAD=ON	\
    -DENABLE_OPENMP=ON \
    -DENABLE_KLU=ON \
    -DKLU_LIBRARY_DIR=/usr/lib \
    -DKLU_INCLUDE_DIR=/usr/include/suitesparse \
    -DEXAMPLES_INSTALL_PATH=/usr/share/sundials/examples
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 $pkgname/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}

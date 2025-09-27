# Maintainer: Ronald van Haren <ronald@archlinux.org>
# Contributor: Chirantan Ekbote <chirantan.ekbote at gmail.com>
# Contributor: Kringel

pkgname=eigen
pkgver=5.0.0
pkgrel=3
pkgdesc='Lightweight C++ template library for vector and matrix math, a.k.a. linear algebra'
arch=(x86_64)
url='https://eigen.tuxfamily.org'
license=(MPL-2.0 Apache-2.0
         BSD-3-Clause Minpack
         'LGPL-2.1-only OR LGPL-2.1-or-later')
depends=(gcc-libs
         glibc)
makedepends=(cmake
             fftw
             freeglut
             gcc-fortran
             git
             suitesparse)
source=(git+https://gitlab.com/libeigen/eigen#tag=$pkgver)
sha256sums=('11808f4e26d9b2aef890c8354f6de43320008776a173c1ddbd05622e70dbbf1f')

build() {
  cmake -B build -S $pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  # install custom licenses
  install -Dm644 $pkgname/COPYING.* -t "$pkgdir/usr/share/licenses/$pkgname"
}

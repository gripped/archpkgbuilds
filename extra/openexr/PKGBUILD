# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=openexr
pkgver=3.4.0
pkgrel=1
pkgdesc='A high dynamic-range image file format library'
url='https://www.openexr.com/'
arch=(x86_64)
license=(BSD-3-Clause)
depends=(gcc-libs
         glibc
         imath
         libdeflate)
makedepends=(cmake
             git)
source=(git+https://github.com/openexr/openexr#tag=v$pkgver)
sha256sums=('ced134434f559c5c61a3e4cdee445e505c61048ad02205090ff543e5c9c49ab1')

build() {
  cmake -B build -S $pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $pkgname/LICENSE.md -t "$pkgdir"/usr/share/licenses/$pkgname
}

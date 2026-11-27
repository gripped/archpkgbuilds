# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=openexr
pkgver=3.5.5
pkgrel=1
pkgdesc='A high dynamic-range image file format library'
url='https://www.openexr.com/'
arch=(x86_64)
license=(BSD-3-Clause)
depends=(glibc
         imath
         libdeflate
         libgcc
         libstdc++
         openjph
         zstd)
makedepends=(cmake
             git
             pybind11)
optdepends=('python: for python bindings')
source=(git+https://github.com/openexr/openexr#tag=v$pkgver)
sha256sums=('a5b418f5a3eeeef1267ffe4e8de25ac1b208d3eebce7ba32586d14fe170ccaf0')

build() {
  cmake -B build -S $pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DOPENEXR_BUILD_PYTHON=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $pkgname/LICENSE.md -t "$pkgdir"/usr/share/licenses/$pkgname

  python -m compileall "$pkgdir"/usr/lib/python*
  python -Om compileall "$pkgdir"/usr/lib/python*
}

# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=openexr
pkgver=3.4.11
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
         openjph)
makedepends=(cmake
             git
             pybind11)
optdepends=('python: for python bindings')
source=(git+https://github.com/openexr/openexr#tag=v$pkgver)
sha256sums=('6cb04f471f8455906ada1641654f284d47892fc59d57c72d043a5da129ec0a92')

prepare() {
# unpin scikit-build-core version
  sed 's|scikit-build-core[^"]*|scikit-build-core|' -i openexr/pyproject.toml
# Fix python module install dir
  git -C $pkgname cherry-pick -n 30345db72944b38926f13b5114b9a01b4b553890
}

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

# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=openexr
pkgver=3.4.2
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
sha256sums=('fe371d2acade8d8b81a76951bf80172780fd79bb887de0d4d63d5705b4228f75')

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

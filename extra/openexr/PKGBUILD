# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=openexr
pkgver=3.3.3
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
sha256sums=('b23d696cea2ed567161ab2172b56a1500084b9608a9a15a37e5bea5c28f2b7a4')

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

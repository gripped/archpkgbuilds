# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=openexr
pkgver=3.4.6
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
             git)
source=(git+https://github.com/openexr/openexr#tag=v$pkgver
        glibc-2.43.patch)
sha256sums=('8d77473d529051fb50f4a3b53b2dc444672200a265b47c0f1472f05fdcefded5'
            'e622ea083fa84d3f7c26c27b826178d68261a59677809b2b8f4d528de3294923')

prepare() {
  patch -d $pkgname -p1 < glibc-2.43.patch
}

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

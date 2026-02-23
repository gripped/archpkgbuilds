# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=openexr
pkgver=3.4.5
pkgrel=1
pkgdesc='A high dynamic-range image file format library'
url='https://www.openexr.com/'
arch=(x86_64)
license=(BSD-3-Clause)
depends=(glibc
         imath
         libdeflate
         libgcc
         libstdc++)
makedepends=(cmake
             git)
source=(git+https://github.com/openexr/openexr#tag=v$pkgver
        glibc-2.43.patch)
sha256sums=('8e592eab3ac9c95917ce863d622673caccdff769ea3a42755cbfb2d5489956f5'
            '738aef7e8098b58c5f9ba40f416cf174f8e5c4323113e3b8ebe6d16aef357c0c')

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

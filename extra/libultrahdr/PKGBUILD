# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=libultrahdr
pkgver=1.1.1
pkgrel=2
pkgdesc='The reference codec for the Ultra HDR format'
arch=(x86_64)
url='https://github.com/google/libultrahdr'
license=(Apache-2.0)
depends=(gcc-libs
         glibc
         libglvnd
         libjpeg-turbo)
makedepends=(cmake
             git)
source=(git+https://github.com/google/libultrahdr#tag=v$pkgver)
sha256sums=('e77d92dcda5b5a0c53ecaa1444ae51102da1e3856dce20c31e0221c666bbf943')

build() {
  cmake -B build -S $pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

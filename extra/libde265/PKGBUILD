# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: James An <james@jamesan.ca>
# Contributor: Daniel Nagy <danielnagy at gmx de>

pkgname=libde265
pkgver=1.1.0
pkgrel=1
pkgdesc='Open h.265 video codec implementation'
arch=(x86_64)
url='https://github.com/strukturag/libde265'
license=(LGPL-3.0-or-later)
depends=(glibc
         libgcc
         libstdc++)
makedepends=(cmake
             git
             sdl2-compat)
optdepends=('sdl2-compat: for the decoder tool')
source=(git+https://github.com/strukturag/libde265#tag=v$pkgver)
sha256sums=('f1f2b3b4ed36d2a3817a4cf32a4ad42f97b72520bbf0e64ebcef40f3beff5e9a')

build() {
  cmake -B build -S $pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_ENCODER=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

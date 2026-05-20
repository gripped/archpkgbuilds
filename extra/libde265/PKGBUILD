# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: James An <james@jamesan.ca>
# Contributor: Daniel Nagy <danielnagy at gmx de>

pkgname=libde265
pkgver=1.0.19
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
sha256sums=('4bf9e8620ac4c7613deecdb31c7d416fa5d817392a52e5a22cfe0c39038fb6da')

build() {
  cmake -B build -S $pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_ENCODER=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

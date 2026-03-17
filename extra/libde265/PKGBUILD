# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: James An <james@jamesan.ca>
# Contributor: Daniel Nagy <danielnagy at gmx de>

pkgname=libde265
pkgver=1.0.17
pkgrel=1
pkgdesc='Open h.265 video codec implementation'
arch=(x86_64)
url='https://github.com/strukturag/libde265'
license=(LGPL-3.0-or-later)
depends=(glibc
         libgcc
         libstdc++
         sdl2-compat)
makedepends=(cmake
             git)
source=(git+https://github.com/strukturag/libde265#tag=v$pkgver)
sha256sums=('9a38e7e178c857736470dca87b91d1346112c5d575ec2d65e82aa67f84c12f43')

build() {
  cmake -B build -S $pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_ENCODER=ON \
    -DENABLE_TOOLS=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

# Remove useless tests binary
  rm "$pkgdir"/usr/bin/tests
}

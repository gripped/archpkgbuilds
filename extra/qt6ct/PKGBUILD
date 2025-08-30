# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Martchus <martchus@gmx.net>

pkgname=qt6ct
pkgver=0.10
pkgrel=5
pkgdesc='Qt 6 Configuration Utility'
arch=(x86_64)
url='https://www.opencode.net/trialuser/qt6ct'
license=(BSD-2-Clause)
depends=(gcc-libs
         glibc
         qt6-base
         qt6-svg)
makedepends=(cmake
             git
             qt6-tools)
source=(git+https://www.opencode.net/trialuser/qt6ct#tag=$pkgver)
sha256sums=('f84b4bdfc9f9dde188b73b2070a9fa81a154d414b72285cc4b945b1e89108fc0')

build() {
  cmake -B build -S $pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $pkgname/COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Kuba Serafinowski <zizzfizzix(at)gmail(dot)com>
# Contributor: Teo Mrnjavac <teo@kde.org>

pkgbase=qtkeychain
pkgname=(qtkeychain-qt6)
pkgver=0.18.0
pkgrel=1
pkgdesc='Provides support for secure credentials storage'
arch=(x86_64)
url='https://github.com/frankosterfeld/qtkeychain'
license=(BSD-3-Clause)
depends=(glib2
         glibc
         libgcc
         libstdc++
         org.freedesktop.secrets
         qt6-base)
makedepends=(cmake
             git
             qt6-declarative
             qt6-tools)
source=(git+https://github.com/frankosterfeld/qtkeychain#tag=$pkgver)
sha256sums=('8da5173ffa4ee7388682f24c1e7e978083e6e2d4e45c81f65e186d5518585f75')

build() {
  cmake -B build -S $pkgbase \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package_qtkeychain-qt6() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $pkgbase/COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kirigami
pkgver=6.15.0
pkgrel=2
pkgdesc='A QtQuick based components set'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(gcc-libs
         glibc
         qt6-base
         qt6-declarative
         qt6-svg)
makedepends=(doxygen
             extra-cmake-modules
             qt6-shadertools
             qt6-tools)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz{,.sig}
        https://invent.kde.org/frameworks/kirigami/-/commit/21788be6.patch)
sha256sums=('733ac7d9c197fe7de90f41643549be3ce0f3723ecd4d4a15758c4c71cafc2531'
            'SKIP'
            'c1d50690c8f03ac726512deaf6b67da786817f4479937995f694860fc88aac60')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB # David Faure <faure@kde.org>
              E0A3EB202F8E57528E13E72FD7574483BB57B18D # Jonathan Esk-Riddell <jr@jriddell.org>
              90A968ACA84537CC27B99EAF2C8DF587A6D4AAC1 # Nicolas Fella <nicolas.fella@kde.org>
              )

prepare() {
  patch -d $pkgname-$pkgver -p1 < 21788be6.patch # Fix menubar in Merkuro
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}


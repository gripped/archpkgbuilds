# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kirigami
pkgver=6.0.0
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
             qt6-doc
             qt6-shadertools
             qt6-tools)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz{,.sig}
        https://invent.kde.org/frameworks/kirigami/-/commit/9eaf9709.patch)
sha256sums=('ed0f56c89249fb92a9af99a94fd13542abbae4a8f1613aaaa2bfab87914b601a'
            'SKIP'
            'c2ef5130dbaa867992ef681fe5338a05cc179e7c9f7ad0c21d4cd9167aaa2942')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB  # David Faure <faure@kde.org>
              E0A3EB202F8E57528E13E72FD7574483BB57B18D) # Jonathan Esk-Riddell <jr@jriddell.org>

prepare() {
  patch -d $pkgname-$pkgver -p1 < 9eaf9709.patch # Fix assert
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}


# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kcontacts
epoch=1
pkgver=6.32.0
pkgrel=1
pkgdesc='Address book API for KDE'
arch=(x86_64)
url='https://develop.kde.org/products/frameworks/'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(libstdc++
         glibc
         kcodecs
         kconfig
         ki18n
         qt6-base)
makedepends=(doxygen
             extra-cmake-modules
             qt6-declarative
             qt6-tools)
optdepends=('qt6-declarative: QML bindings')
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('8c67fafff1c9cb84fdc7ca6bb66988e3084bb44ba1b2e5fd0f2ebe40ca8f2198'
            'SKIP')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB # David Faure <faure@kde.org>
              90A968ACA84537CC27B99EAF2C8DF587A6D4AAC1 # Nicolas Fella <nicolas.fella@kde.org>
              )

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kuserfeedback
pkgver=6.0.0
pkgrel=2
pkgdesc='Framework for collecting user feedback for applications via telemetry and surveys'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(gcc-libs
         glibc
         qt6-base)
makedepends=(clang
             extra-cmake-modules
             qt6-charts
             qt6-declarative
             qt6-svg
             qt6-tools)
optdepends=('qt6-charts: Feedback console'
            'qt6-declarative: QML bindings'
            'qt6-svg: Feedback console')
conflicts=(kuserfeedback5)
replaces=(kuserfeedback5)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('02f1af108e253c842526d31c997a1777b8f7a6e5b8698b5b1267ce1ec128af2b'
            'SKIP')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB  # David Faure <faure@kde.org>
              E0A3EB202F8E57528E13E72FD7574483BB57B18D) # Jonathan Esk-Riddell <jr@jriddell.org>

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

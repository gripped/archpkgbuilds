# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kdevelop-python
pkgver=25.04.0
pkgrel=1
pkgdesc='Python language and documentation plugin for KDevelop'
arch=(x86_64)
url='https://www.kdevelop.org/'
license=(GPL-2.0-or-later)
depends=(gcc-libs
         glibc
         kconfig
         kcoreaddons
         kdevelop
         ki18n
         kparts
         ktexteditor
         kwidgetsaddons
         kxmlgui
         python
         qt6-base
         threadweaver)
makedepends=(extra-cmake-modules)
optdepends=('python-pycodestyle: for Python style checking')
groups=(kde-applications
        kdevelop)
source=(https://download.kde.org/stable/release-service/$pkgver/src/kdev-python-$pkgver.tar.xz{,.sig})
sha256sums=('7f628302686f9f51607d39267964b6f99dd6beb7f6a25b97cf134dc316e2c1f6'
            'SKIP')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87  # Christoph Feck <cfeck@kde.org>
              D81C0CB38EB725EF6691C385BB463350D6EF31EF) # Heiko Becker <heiko.becker@kde.org>

build() {
  cmake -B build -S kdev-python-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

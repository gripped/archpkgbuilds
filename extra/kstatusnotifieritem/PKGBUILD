# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kstatusnotifieritem
pkgver=6.12.0
pkgrel=1
pkgdesc='Implementation of Status Notifier Items'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-or-later)
depends=(gcc-libs
         glibc
         kwindowsystem
         qt6-base)
makedepends=(doxygen
             extra-cmake-modules
             pyside6
             python-build
             python-setuptools
             qt6-doc
             qt6-tools)
optdepends=('pyside6: Python bindings')
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('5b0e7b20492dbd9d5742bbafd6f8577dc682480a615e1965f3c53741e684fc3d'
            'SKIP')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB # David Faure <faure@kde.org>
              E0A3EB202F8E57528E13E72FD7574483BB57B18D # Jonathan Esk-Riddell <jr@jriddell.org>
              90A968ACA84537CC27B99EAF2C8DF587A6D4AAC1 # Nicolas Fella <nicolas.fella@kde.org>
              )

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

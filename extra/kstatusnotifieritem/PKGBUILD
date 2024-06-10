# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kstatusnotifieritem
pkgver=6.3.0
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
             qt6-doc
             qt6-tools)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('ce1f2e33d0dbe81a48f0040977b7b7aa7234f6a003173e395b3de5d783398cd8'
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

# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kholidays
pkgver=6.32.0
pkgrel=1
epoch=1
pkgdesc='KDE library for regional holiday information'
arch=(x86_64)
url='https://develop.kde.org/products/frameworks/'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(libstdc++
         glibc
         qt6-base)
makedepends=(doxygen
             extra-cmake-modules
             qt6-declarative
             qt6-tools)
optdepends=('qt6-declarative: QML bindings')
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz{,.sig}
        https://invent.kde.org/frameworks/kholidays/-/commit/ad077fe3b806c247bc433eaebf34baaceba35f7a.patch)
sha256sums=('a6aeede0b1c5bba93f7e60d7c6fe84051cb32d90d3981202c4f90237b5fc17a7'
            'SKIP'
            '81855c3daf54fe5b4a0695cb17aa7dd3eb3d4992548780cf2b0f16cadfc3d3ed')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB # David Faure <faure@kde.org>
              90A968ACA84537CC27B99EAF2C8DF587A6D4AAC1 # Nicolas Fella <nicolas.fella@kde.org>
              )

prepare() {
  patch -d $pkgname-$pkgver -p1 < ad077fe3b806c247bc433eaebf34baaceba35f7a.patch # Fix build with flex 2.6.10
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

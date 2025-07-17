# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kirigami
pkgver=6.16.0
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
        https://invent.kde.org/frameworks/kirigami/-/commit/12892328.patch
        https://invent.kde.org/frameworks/kirigami/-/commit/8d96bcc3.patch
        https://invent.kde.org/frameworks/kirigami/-/commit/140067bb.patch)
sha256sums=('16d1142aacd8514f95cf9bdb44b2a720f3397b5ee68a489a54c86a560af55516'
            'SKIP'
            '830fcf415a50f86a88ad785654c1437b19f524e27c339904f54042b88a86377d'
            'b9a2525c0683bc01c1f81f6bde44bbe9df25bb773e6e3f74e1b0ac104585cb96'
            'da07315df607f39809d46e347678e661d4a9ea4a6fd118b70895ec6c3b8bb394')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB # David Faure <faure@kde.org>
              E0A3EB202F8E57528E13E72FD7574483BB57B18D # Jonathan Esk-Riddell <jr@jriddell.org>
              90A968ACA84537CC27B99EAF2C8DF587A6D4AAC1 # Nicolas Fella <nicolas.fella@kde.org>
              )

prepare() {
  patch -d $pkgname-$pkgver -p1 < 12892328.patch
  patch -d $pkgname-$pkgver -p1 < 8d96bcc3.patch
  patch -d $pkgname-$pkgver -p1 < 140067bb.patch # Fix crash with software renderer
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}


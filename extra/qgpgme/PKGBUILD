# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=qgpgme
pkgver=2.1.0
pkgrel=1
pkgdesc='Qt bindings for GPGME'
arch=(x86_64)
url='https://gnupg.org/software/gpgme/index.html'
license=(GPL-2.0-or-later)
depends=(glibc
         gpgmepp
         libgcc libgcc_s.so
         libstdc++ libstdc++.so
         qt6-base)
makedepends=(cmake
             git)
conflicts=(qgpgme-qt6)
provides=(qgpgme-qt6)
replaces=(qgpgme-qt6)
source=(git+https://dev.gnupg.org/source/gpgmeqt#tag=gpgmeqt-$pkgver)
sha256sums=('2601b9fafa0b974768d24112613d839e1b6828ec5a7f2fb8b02fb601fcef6e39')

prepare() {
  git -C gpgmeqt cherry-pick -n 150b23c105f3ea7034e6f106e60686aea4e4a13e # Fix kmail crashes
}

build() {
  cmake -B build -S gpgmeqt \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_WITH_QT5=false \
    -DBUILD_WITH_QT6=true
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

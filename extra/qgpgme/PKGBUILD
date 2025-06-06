# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=qgpgme
pkgver=2.0.0
pkgrel=1
pkgdesc='Qt bindings for GPGME'
arch=(x86_64)
url='https://gnupg.org/software/gpgme/index.html'
license=(GPL-2.0-or-later)
depends=(gcc-libs
         glibc
         gpgmepp
         qt6-base)
makedepends=(cmake
             git)
conflicts=(qgpgme-qt6)
provides=(qgpgme-qt6)
replaces=(qgpgme-qt6)
source=(git+https://dev.gnupg.org/source/gpgmeqt#tag=gpgmeqt-$pkgver)
sha256sums=('d48db1e5c6cb36eeff4379169a9a7558da8e134a5ce6b88409ecbc70e3183afc')

build() {
  cmake -B build -S gpgmeqt \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: trya <tryagainprod@gmail.com>

pkgbase=quazip
pkgname=(quazip-qt6)
pkgver=1.6
pkgrel=1
pkgdesc='C++ wrapper for the ZIP/UNZIP C package'
url='https://stachenov.github.io/quazip/'
license=(LGPL-2.1-or-later)
arch=(x86_64)
depends=(bzip2
         glibc
         libgcc
         libstdc++
         qt6-base
         qt6-5compat
         zlib)
makedepends=(cmake
             git)
source=(git+https://github.com/stachenov/quazip#tag=v$pkgver)
sha256sums=('14d37474ced858799ff3dfd040c535b710a9378df5f8511a71a1dd94868584d5')

build() {
  cmake -B build -S $pkgbase \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DQUAZIP_QT_MAJOR_VERSION=6
  cmake --build build
}

package_quazip-qt6() {
  DESTDIR="$pkgdir" cmake --install build
}

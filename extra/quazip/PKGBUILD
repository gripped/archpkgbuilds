# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: trya <tryagainprod@gmail.com>

pkgbase=quazip
pkgname=(quazip-qt6)
pkgver=1.5
pkgrel=2
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
sha256sums=('2929e71afe9535b7b6c6c3203534c258d6abe5d43627a5e33e68ca75ad883695')

build() {
  cmake -B build -S $pkgbase \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DQUAZIP_QT_MAJOR_VERSION=6
  cmake --build build
}

package_quazip-qt6() {
  DESTDIR="$pkgdir" cmake --install build
}

# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=ksnip
pkgver=1.10.1
pkgrel=5
pkgdesc='Qt-based screenshot tool that provides many annotation features'
arch=('x86_64')
url='https://github.com/ksnip/ksnip'
license=(GPL-3.0-or-later)
depends=(gcc-libs
         glibc
         kimageannotator
         libx11
         libxcb
         qt6-base)
makedepends=(extra-cmake-modules
             git
             qt6-tools)
source=(git+https://github.com/ksnip/ksnip#tag=v$pkgver)
sha256sums=('ef434afdef93f93690dea1f1bc2522b443b490fd87c5f3211110908174638bef')

prepare() {
  cd $pkgname
  git cherry-pick -n 76f4b381 # Fix build with kimageannotator 0.7.1
  git cherry-pick -n 82499f6a8b3483f17fd74cc0e1293d82db276100 # Port to Qt 6  
}

build() {
  cmake -B build -S $pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_WITH_QT6=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=libmad
pkgver=0.16.5
pkgrel=1
pkgdesc="A high-quality MPEG audio decoder"
arch=('x86_64')
url="https://codeberg.org/tenacityteam/${pkgname}"
license=('GPL-2.0-or-later')
depends=('glibc')
makedepends=('cmake' 'git')
source=("git+${url}.git#tag=${pkgver}")
b2sums=('815f38c2617d436adf4b7644fd2fd9aaffb034678f9991b4712dacc0eb459f4c805318b5875b2be31d9eea4d2c0a67019e58d5fa9160c5d0c904da266d046fa6')

prepare() {
  cd ${pkgname}
  # Arch strips static libraries, so do not export the removed mad-static target.
  sed -i 's/install(TARGETS \${ALL_MAD_TARGETS}/install(TARGETS mad/' CMakeLists.txt
}

build() {
  cd ${pkgname}
  cmake -D CMAKE_INSTALL_PREFIX=/usr -S . -B build
  cmake --build build
}

package() {
  cd ${pkgname}
  DESTDIR="${pkgdir}" cmake --install build
}

# Maintainer: AndyRTR <andyrtr@archlinux.org>
# Conributor: Mélanie Chauvel (ariasuni) <perso at hack-libre dot org>

pkgname=nuspell
pkgver=5.1.5
pkgrel=1
pkgdesc='Fast and safe spellchecking C++ library'
arch=('x86_64')
url='https://nuspell.github.io/'
license=('LGPL-3.0-or-later')
depends=('icu' 'glibc' 'gcc-libs')
makedepends=('cmake' 'pandoc')
checkdepends=('catch2' 'expat')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/nuspell/nuspell/archive/v${pkgver}.tar.gz")
sha512sums=('91a18e1cf8dd7565e4981182f32515a0fbde593436197a8e2f6937a2aca6eed151b482e2dcb27b2cd3da48178fbce53c4047e46f79ec245bd9000931b0266084')

# 1st rebuild enchant
# 2nd rebuild epiphany against nuspell/enchant that checkdepens on both

build() {
  cmake -B "${pkgname}-${pkgver}"/build \
    -S ${pkgbase}-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DBUILD_SHARED_LIBS=ON
  cmake --build "${pkgname}-${pkgver}"/build
}

check() {
  ctest --test-dir "${pkgname}-${pkgver}"/build
}

package() {
  DESTDIR="${pkgdir}" cmake --install "${pkgname}-${pkgver}"/build
}

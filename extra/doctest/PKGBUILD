# Maintainer: Santiago Torres-Arias <santiago in el archlinux organization>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname=doctest
pkgver=2.5.0
pkgrel=1
pkgdesc='The lightest feature rich C++ single header testing framework'
arch=('any')
url='https://github.com/doctest/doctest'
license=('MIT')
makedepends=('cmake')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
b2sums=('fbb51b0ff3a20ee425e2dfc9372741e8a5a53ec9759aa4898af4d3aa6594cdcee0b452eb61794653b48655a7e1b5519701f3a02994dcddb10f6cabc25de9f1c0')

build() {
  cmake -S ${pkgname}-${pkgver} -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  cd ${pkgname}-${pkgver}
  install -vDm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.txt
}

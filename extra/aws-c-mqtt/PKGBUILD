# Maintainer: Anatol Pomozov
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=aws-c-mqtt
pkgver=0.13.0
pkgrel=1
pkgdesc='C99 implementation of the MQTT 3.1.1 specification'
arch=(x86_64)
url='https://github.com/awslabs/aws-c-mqtt'
license=(Apache-2.0)
depends=(
  aws-c-common
  aws-c-http
  aws-c-io
  glibc
)
makedepends=(cmake)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('8aa9e5b8f90a6aecdb85e83786b3543afa2a414738049447fd3ba5d1afef519b')

build() {
  cd $pkgname-$pkgver
  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev \
    -DBUILD_SHARED_LIBS=ON
  cmake --build build
}

check() {
  cd $pkgname-$pkgver
  cmake --build build --target test
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" cmake --install build
}

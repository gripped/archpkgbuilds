# Maintainer: Anatol Pomozov
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=aws-c-mqtt
pkgver=0.10.4
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
sha256sums=('6a41456f9eee15d71e4e2ee162b354865809f26620f1e6e5acb237f190f77f3f')

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

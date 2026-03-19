# Maintainer: Anatol Pomozov
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=aws-c-mqtt
pkgver=0.15.0
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
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('a1f5323f6d79ed5833d29de3416892d4f7f06c97f813988a65490ae06ac197ffcf8f15f74f19e0b0b221e9ecd83e61dcd34a9267166a57805ee36a51225a53a2')

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

# Maintainer: Anatol Pomozov
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=aws-crt-cpp
pkgver=0.43.6
pkgrel=1
pkgdesc='C++ wrapper around the aws-c-* libraries. Provides Cross-Platform Transport Protocols and SSL/TLS implementations for C++.'
arch=(x86_64)
url='https://github.com/awslabs/aws-crt-cpp'
license=(Apache-2.0)
depends=(
  aws-c-auth
  aws-c-cal
  aws-c-common
  aws-c-event-stream
  aws-c-http
  aws-c-io
  aws-c-mqtt
  aws-c-s3
  aws-c-sdkutils
  aws-checksums
  glibc
  libgcc
  libstdc++
)
makedepends=(cmake)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('b0956785c2b875e94426c0c2f08a656db211c5b869ae76e6df85d88c672c1d727ff9c5bd21ed91e200ed88933c57f06df608ce0d700e1d08a4bca4ef23c288f1')

build() {
  cmake -S $pkgname-$pkgver -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_DEPS=OFF
  cmake --build build
}

check() {
  cmake --build build --target test
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

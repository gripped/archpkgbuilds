# Maintainer: Anatol Pomozov
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=aws-crt-cpp
pkgver=0.37.2
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
  gcc-libs
  glibc
)
makedepends=(cmake)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('21ad96e58f082047030f7d2ab4d79a5402b7964650fb6f7f76bb3a2850b276ed184240ba969bf007a809cd6be709920f1a8b6a8453c66774f941fadf4589d4c7')

build() {
  cd $pkgname-$pkgver
  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_DEPS=OFF
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

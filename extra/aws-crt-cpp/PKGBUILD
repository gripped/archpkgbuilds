# Maintainer: Anatol Pomozov
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=aws-crt-cpp
pkgver=0.43.7
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
b2sums=('94dd54730662d5cb3a77ca6feb64ed6d5ffbe0f9cd49fc4700e4c789fd38cf2d2ffd4c3d09c14ab1c725f9db235b64cef9bb8529457bead688ff0e0adf47f596')

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

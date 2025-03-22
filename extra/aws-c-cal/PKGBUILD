# Maintainer: Anatol Pomozov
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=aws-c-cal
pkgver=0.8.8
pkgrel=1
pkgdesc='AWS Crypto Abstraction Layer: Cross-Platform, C99 wrapper for cryptography primitives'
arch=(x86_64)
url='https://github.com/awslabs/aws-c-cal'
license=(Apache-2.0)
depends=(
  aws-c-common
  glibc
  openssl
)
makedepends=(cmake)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('45a5e5e4b9070b02c8a847ff7531068f882622a4e8ac4fed4776b7729f018ea9')

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

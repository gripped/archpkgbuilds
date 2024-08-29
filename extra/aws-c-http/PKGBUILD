# Maintainer: Anatol Pomozov
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=aws-c-http
pkgver=0.8.8
pkgrel=1
pkgdesc='C99 implementation of the HTTP/1.1 and HTTP/2 specifications'
arch=(x86_64)
url='https://github.com/awslabs/aws-c-http'
license=(Apache-2.0)
depends=(
  aws-c-cal 
  aws-c-common
  aws-c-compression
  aws-c-io
  glibc
)
makedepends=(cmake)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4c3a4a6845653c1b01162968f936c31aea6b25d3a0bdbf050b2342b8b94fcca6')

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

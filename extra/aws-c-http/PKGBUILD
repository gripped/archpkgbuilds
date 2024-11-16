# Maintainer: Anatol Pomozov
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=aws-c-http
pkgver=0.9.2
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
sha256sums=('328013ebc2b5725326cac01941041eec1e1010058c60709da2c23aa8fb967370')

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

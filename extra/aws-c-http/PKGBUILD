# Maintainer: Anatol Pomozov
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=aws-c-http
pkgver=0.10.11
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
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('9ebc091d4b26a72321125e80682d81f6051ca0fb1ee335bdf7cd55f880a398182cad650db8340a53937ac4d5c8c1986b190ace21ddf0197c6ff58c2e431e36db')

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

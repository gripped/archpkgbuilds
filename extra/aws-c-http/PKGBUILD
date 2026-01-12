# Maintainer: Anatol Pomozov
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=aws-c-http
pkgver=0.10.8
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
sha256sums=('214b64fe47a1eb3abab7d00a002af6668700ee51c5bc2f04f01335c94bd23425')

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

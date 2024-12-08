# Maintainer: Anatol Pomozov
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=aws-c-s3
pkgver=0.7.2
pkgrel=1
pkgdesc='C99 library implementation for communicating with the S3 service, designed for maximizing throughput on high bandwidth EC2 instances'
arch=(x86_64)
url='https://github.com/awslabs/aws-c-s3'
license=(Apache-2.0)
depends=(
  aws-c-auth
  aws-c-cal
  aws-c-common
  aws-c-http
  aws-c-io
  aws-checksums
  glibc
)
makedepends=(cmake)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4af522456b6e48741aea190ad9a32cc0fcb81b01c5e9ec5d0a782f855329c8b1')

build() {
  cd $pkgname-$pkgver
  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev \
    -DBUILD_SHARED_LIBS=ON \
    -DENABLE_NET_TESTS=OFF
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

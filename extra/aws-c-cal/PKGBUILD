# Maintainer: Anatol Pomozov
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=aws-c-cal
pkgver=0.9.3
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
sha256sums=('7033e3efecbb1f6eddd0f549bb071b166e1aaca5f8fb4b215d0d0de5cb2e9496')

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

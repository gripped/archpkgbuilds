# Maintainer: Anatol Pomozov
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=aws-checksums
pkgver=0.2.2
pkgrel=1
pkgdesc='Cross-Platform HW accelerated CRC32c and CRC32 with fallback to efficient SW implementations.'
arch=(x86_64)
url='https://github.com/awslabs/aws-checksums'
license=(Apache-2.0)
depends=(
  aws-c-common
  glibc
)
makedepends=(cmake)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('96acfea882c06acd5571c845e4968892d6ffc0fae81b31a0b1565100049743b2')

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

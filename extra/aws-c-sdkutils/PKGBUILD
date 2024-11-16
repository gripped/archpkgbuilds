# Maintainer: Anatol Pomozov
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=aws-c-sdkutils
pkgver=0.2.1
pkgrel=1
pkgdesc='AWS SDK utility library'
arch=(x86_64)
url='https://github.com/awslabs/aws-c-sdkutils'
license=(Apache-2.0)
depends=(
  aws-c-common
  glibc
)
makedepends=(cmake)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('17bdec593f3ae8a837622ef81055db81cc2dd14b86d33b21df878a7ab918d0e4')

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

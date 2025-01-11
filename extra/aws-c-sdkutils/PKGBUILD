# Maintainer: Anatol Pomozov
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=aws-c-sdkutils
pkgver=0.2.2
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
sha256sums=('75defbfd4d896b8bdc0790bd25d854218acae61b9409d1956d33832924b82045')

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

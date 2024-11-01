# Maintainer: Anatol Pomozov
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=aws-c-sdkutils
pkgver=0.2.0
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
sha256sums=('5c73caa1c0ebde71b357d05a8f0ff6c1be09b32e0935b16d7385c9342f3e59c2')

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

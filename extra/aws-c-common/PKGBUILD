# Maintainer: Anatol Pomozov
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=aws-c-common
pkgver=0.12.1
pkgrel=1
pkgdesc='Core c99 package for AWS SDK for C. Includes cross-platform primitives, configuration, data structures, and error handling'
arch=(x86_64)
url='https://github.com/awslabs/aws-c-common'
license=(Apache-2.0)
depends=(glibc)
makedepends=(cmake)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('303505ed8770be88364c5fb7cac1843e5958ea1389cca8f1f0a84103d7660494')

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

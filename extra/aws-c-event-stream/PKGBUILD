# Maintainer: Anatol Pomozov
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=aws-c-event-stream
pkgver=0.5.9
pkgrel=1
pkgdesc='C99 implementation of the vnd.amazon.eventstream content-type'
arch=(x86_64)
url='https://github.com/awslabs/aws-c-event-stream'
license=(Apache-2.0)
depends=(
  aws-c-common
  aws-c-io
  aws-checksums
  glibc
)
makedepends=(cmake)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e9371ffe050c24ca4eda439d58a06285db88b550e9cbec006d6ea21db02d424a')

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

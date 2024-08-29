# Maintainer: Anatol Pomozov
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=aws-c-event-stream
pkgver=0.4.3
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
sha256sums=('d7d82c38bae68d2287ac59972a76b2b6159e7a3d7c9b7edb1357495aa4d0c0de')

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

# Maintainer: Anatol Pomozov
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=aws-c-event-stream
pkgver=0.5.0
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
sha256sums=('3a53a9d05f9e2fd06036a12854a8b4f05a0c4858bb5b8df8a30edba9de8532b5')

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

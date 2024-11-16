# Maintainer: Anatol Pomozov
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=aws-c-io
pkgver=0.15.3
pkgrel=1
pkgdesc='AWS SDK module to handle all IO and TLS work for application protocols'
arch=(x86_64)
url='https://github.com/awslabs/aws-c-io'
license=(Apache-2.0)
depends=(
  aws-c-cal
  aws-c-common
  glibc
  s2n-tls
)
makedepends=(cmake)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d8cb4d7d3ec4fb27cbce158d6823a1f2f5d868e116f1d6703db2ab8159343c3f')

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

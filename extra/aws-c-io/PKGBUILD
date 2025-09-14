# Maintainer: Anatol Pomozov
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=aws-c-io
pkgver=0.22.0
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
sha256sums=('07b0ac7271e482e1f5f1e84fcf33ec23fb8a2c12e7a7f331455a5f1d38b9fbfd')

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

# Maintainer: Anatol Pomozov
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=aws-c-auth
pkgver=0.7.26
pkgrel=1
pkgdesc='C99 library implementation of AWS client-side authentication: standard credentials providers and signing'
arch=(x86_64)
url='https://github.com/awslabs/aws-c-auth'
license=(Apache-2.0)
depends=(
  aws-c-cal
  aws-c-common
  aws-c-http
  aws-c-io
  aws-c-sdkutils
  glibc
)
makedepends=(cmake)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7ec249622ac4eee38e9f974f9c0e6f3f06f3e3b55eba56e5934b0633f0e5e808')

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

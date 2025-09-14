# Maintainer: Anatol Pomozov
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=s2n-tls
pkgver=1.5.25
pkgrel=1
pkgdesc='A C99 implementation of the TLS/SSL protocols that is designed to be simple, small, fast, and with security as a priority'
arch=(x86_64)
url='https://github.com/aws/s2n-tls'
license=(Apache-2.0)
provides=(s2n) # upstream renamed the project from s2n to s2n-tls
conflicts=(s2n)
replaces=(s2n)
depends=(
  gcc-libs
  glibc
  openssl
)
makedepends=(cmake)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ba7d7000a13e109c062e758afa26a6355d7fae3a7279da17e69f0d5a74e438f2')

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

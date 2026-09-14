# Maintainer: Anatol Pomozov
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=s2n-tls
pkgver=1.7.9
pkgrel=1
pkgdesc='A C99 implementation of the TLS/SSL protocols that is designed to be simple, small, fast, and with security as a priority'
arch=(x86_64)
url='https://github.com/aws/s2n-tls'
license=(Apache-2.0)
depends=(
  glibc
  libgcc
  openssl
)
makedepends=(cmake)
provides=(s2n) # upstream renamed the project from s2n to s2n-tls
conflicts=(s2n)
replaces=(s2n)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('c75bfd9a658f94ba667385072c65f6c470562fd0b80f4c507b92c21d8e9a8bd84b753db55b07c78c359c43c7b51bb7364d017cc4c8afccc529fe2383a48ce4e8')

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
  ctest --test-dir build --output-on-failure \
    -E s2n_override_openssl_random_test
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" cmake --install build
}

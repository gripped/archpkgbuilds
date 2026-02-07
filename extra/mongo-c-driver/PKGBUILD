# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=mongo-c-driver
pkgver=1.30.7
pkgrel=1
pkgdesc="A client library written in C for MongoDB"
arch=(x86_64)
url="https://github.com/mongodb/mongo-c-driver"
license=(Apache-2.0)
depends=(
  glibc
  libsasl
  openssl
  snappy
  zstd
)
makedepends=(cmake)
provides=(
  libbson
  libbson-1.0.so
  libmongoc
  libmongoc-1.0.so
)
conflicts=(
  libbson
  libmongoc
)
replaces=(
  libbson
  libmongoc
)
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('374dd5ca2e01f08e833b85b313ae256e439364f5e144e45ffc207fe414862aa8fe9d12e0d949a17f6d30070109c070d5ba29c4adacf94f871c03986b9026dae7')

build() {
  cd $pkgname-$pkgver
  # ENABLE_STATIC=ON is required to build tests.
  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev \
    -DBUILD_VERSION="$pkgver" \
    -DENABLE_STATIC=ON \
    -DENABLE_TESTS=ON
  cmake --build build
}

check() {
  cd $pkgname-$pkgver
  cmake --build build --target check
  export MONGOC_TEST_OFFLINE=ON
  export MONGOC_TEST_SKIP_LIVE=ON
  local skip_tests=(
    mongoc/Client/ipv6/single
    mongoc/ClientPool/openssl/change_ssl_opts
    mongoc/MongoDB/handshake/null_args
    mongoc/TOPOLOGY/scanner_ssl
    mongoc/azure/imds/http/talk
    mongoc/gcp/http/talk
  )
  local skip_tests_pattern="${skip_tests[0]}$(printf '|%s' "${skip_tests[@]:1}")"
  ctest --test-dir build --output-on-failure -E "$skip_tests_pattern"
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" cmake --install build
}

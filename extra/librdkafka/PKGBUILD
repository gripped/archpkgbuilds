# Maintainer: Anatol Pomozov
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Joel Teichroeb <joel at teichroeb dot net>
# Contributor: Alim Gokkaya <alimgokkaya at gmail dot com>

pkgname=librdkafka
pkgver=2.13.0
pkgrel=1
pkgdesc='The Apache Kafka C/C++ library'
arch=(x86_64)
url='https://github.com/confluentinc/librdkafka'
license=(
  Apache-2.0
  BSD-2-Clause
  BSD-3-Clause
  MIT
  Zlib
)
depends=(
  curl
  gcc-libs
  glibc
  libsasl
  lz4
  openssl
  zlib
  zstd
)
makedepends=(
  cmake
  python
  rapidjson
)
provides=(librdkafka.so)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ac44ed450ccd2c4ab4cdeba70115e6f878d794d6df3e61c9f47902f766852058')

build() {
  cd $pkgname-$pkgver
  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build
}

check() {
  cd $pkgname-$pkgver
  local skip_tests=(
	  RdKafkaTestInParallel
	  RdKafkaTestSequentially
    RdKafkaTestBrokerLess
  )
  local skip_tests_pattern="${skip_tests[0]}$(printf '|%s' "${skip_tests[@]:1}")"
  ctest --test-dir build --output-on-failure -E "$skip_tests_pattern"
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" cmake --install build
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
}

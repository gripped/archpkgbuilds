# Maintainer: Anatol Pomozov
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Joel Teichroeb <joel at teichroeb dot net>
# Contributor: Alim Gokkaya <alimgokkaya at gmail dot com>

pkgname=librdkafka
pkgver=2.14.1
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
  glibc
  libgcc
  libsasl
  libstdc++
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
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('f27e4f22c5515c86d87d13829ee5a06b7e9d82f57b856fd02a12db081247a0f023d693c48d960cea17b072620ac7d33c0d2d57dc0d228f24ae53469a68bd5ac5')

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

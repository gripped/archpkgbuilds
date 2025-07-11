# Maintainer: Anatol Pomozov
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Joel Teichroeb <joel at teichroeb dot net>
# Contributor: Alim Gokkaya <alimgokkaya at gmail dot com>

pkgname=librdkafka
pkgver=2.11.0
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
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
  "remove-failing-tests.patch"
)
sha256sums=('592a823dc7c09ad4ded1bc8f700da6d4e0c88ffaf267815c6f25e7450b9395ca'
            '23c8d030179724d13a91f13cf566b045b195d64a3219eb2c5122d06e1e1c6fd1')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i "$srcdir/remove-failing-tests.patch"
}

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
  ctest --test-dir build --output-on-failure \
    --tests-regex RdKafkaTestBrokerLess
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" cmake --install build
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
}

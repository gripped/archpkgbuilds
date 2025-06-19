# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Christian Heusel <gromit@archlinux.org>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Matthias Blaicher <matthias@blaicher.com>
# Contributor: Severen Redwood <severen@shrike.me>

pkgname=capnproto
pkgver=1.2.0
pkgrel=1
pkgdesc="Cap'n Proto serialization/RPC system"
arch=(x86_64)
url="https://capnproto.org/"
license=(MIT)
depends=(
  gcc-libs
  glibc
  openssl
  zlib
)
makedepends=(cmake)
provides=(
  libcapnp.so
  libcapnp-json.so
  libcapnp-rpc.so
  libcapnpc.so
  libkj-async.so
  libkj-gzip.so
  libkj-http.so
  libkj-test.so
  libkj-tls.so
  libkj.so
)
source=($pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz)
sha512sums=('342f08683e60b8346f7d119242781835889d7804d54fca00348f14abe9f76bcb4572678dd4d3471c638cabe94e5a77aaf7c19b6edf297cb25a319ac544c659e4')
b2sums=('4d95c0bbf602238c5bf01b0ac5929ee87b25becbe4dcab64992fa843122dac990f267babe09048add7c9825aec62b16ca78e75356362bd2a0da343bf2168f8e7')

build() {
  local cmake_options=(
      -B build
      -D BUILD_SHARED_LIBS=ON
      -D CMAKE_BUILD_TYPE=None
      -D CMAKE_INSTALL_PREFIX=/usr
      -S $pkgname-$pkgver
      -W no-dev
  )

  cmake "${cmake_options[@]}"
  cmake --build build --verbose
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -vDm 644 $pkgname-$pkgver/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 $pkgname-$pkgver/{CONTRIBUTORS,README.md} -t "$pkgdir/usr/share/doc/$pkgname/"
}
# vim:set ts=2 sw=2 et:

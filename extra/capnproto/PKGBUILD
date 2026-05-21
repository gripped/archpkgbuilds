# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Christian Heusel <gromit@archlinux.org>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Matthias Blaicher <matthias@blaicher.com>
# Contributor: Severen Redwood <severen@shrike.me>

pkgname=capnproto
pkgver=1.4.0
pkgrel=1
pkgdesc="Cap'n Proto serialization/RPC system"
arch=(x86_64)
url="https://capnproto.org/"
license=(MIT)
depends=(
  glibc
  libgcc
  libstdc++
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
sha512sums=('6f31294ffe613b28ee891a7e7465d35781697dc7ed51f806b7c707c8fc94ead01099ab356041646e382320ff922f40c393b4b58f3106bbc3fb547386d7c0ed1a')
b2sums=('7194f5cce53fa0e4e24a724da019c31b536860388417e2500fcb23c4a7c9e933d88b626b5f3632b050b33172217652cd890f328a87f331eeb409ef665aaf7167')

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

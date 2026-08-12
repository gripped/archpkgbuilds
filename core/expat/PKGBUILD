# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=expat
pkgver=2.8.3
pkgrel=1
pkgdesc="An XML parser library"
arch=(x86_64)
url="https://libexpat.github.io/"
_url="https://github.com/libexpat/libexpat"
license=(MIT)
depends=(glibc)
makedepends=(
  cmake
  git
)
provides=(libexpat.so)
source=($pkgname::git+$_url?signed#tag=R_${pkgver//./_})
sha512sums=('1764d048937fac5c6d08165a206dcb653e923e930135269ce28347f9c0126fa3a2a5b54053eb362a0fb9930fd3081fd13ca56a3cfa259a5927c99cfabb421029')
b2sums=('ba99006d234d94dd293d6b14ceb2bc906a9c96e4b7b2b38539616fa9033ba5f3fd38daad2851818e66dd5310cf1db65b5583c6dbb4922a803c6d1c49d9e63f9e')
validpgpkeys=(3176EF7DB2367F1FCA4F306B1F9B0E909AF37285) # Sebastian Pipping

build() {
  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -S $pkgname/$pkgname
    -W no-dev
  )

  cmake "${cmake_options[@]}"
  cmake --build build --verbose
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -vDm 644 $pkgname/$pkgname/COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 $pkgname/$pkgname/{AUTHORS,Changes,README.md} -t "$pkgdir/usr/share/doc/$pkgname/"
}

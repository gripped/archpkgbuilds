# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=expat
pkgver=2.7.2
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
sha512sums=('a497cb63c23e886b2daeb9351d1efc0bb1f096a77a56afe1377560bbee936678fcf0511393a75226f6c18e80e1b4a559ba24884ad7e7f5ab5aa7f5d7a9bac087')
b2sums=('fb64f45da0db9b1f52af8efc446cd02335be8164a41c24ccf9d1ceb173007343492487988166806a9eabd420e310b2006b1f3cbeaba7d8aaaea097dc3dd5d26f')
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

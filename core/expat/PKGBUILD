# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=expat
pkgver=2.7.4
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
sha512sums=('fc81f2c1ac431994b315ab70ae9ef2dd58ce94c6f026aa4e22747bfb3619efbeff4d26e0f6b925d887bd3acdd36e004faf4ecc3ea13d572e3b0576f23360bb0c')
b2sums=('8a194ee7bc3733e65ed6e84595104363cc4dc8996a450f9144967570609a39cf619efb9351a4984caa56ee35f5222ebbfb72b2f4df474a1a2d900f51d36f474b')
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

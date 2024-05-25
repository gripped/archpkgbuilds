# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=c-ares
pkgver=1.29.0
pkgrel=1
pkgdesc="A C library for asynchronous DNS requests"
arch=(x86_64)
url="https://c-ares.org/"
license=(MIT)
depends=(glibc)
makedepends=(cmake)
provides=(libcares.so)
source=(
  $url/download/$pkgname-$pkgver.tar.gz{,.asc}
)
sha512sums=('0287fd59aa6d831e0d1705deb6b4b1ab3b97a28c5c42feeeaa1eeab55ffb429998c7f0735f15cf5eaeb9177cb77800e6b0b01107bd28fb082cf737f8c12766d0'
            'SKIP')
b2sums=('7dd6a0dc85d3383087726cd48e75b481f4ef7551a41590de21b7f30f9e588d7bef87c852203b91f281b0fbf44dca75f0ae538f6a3c17fe8ff29c802d05d36189'
        'SKIP')
validpgpkeys=('27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2') # Daniel Stenberg <daniel@haxx.se>

build() {
  local cmake_options=(
    -B build
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_BUILD_TYPE=None
    -S $pkgname-$pkgver
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
  install -vDm 644 $pkgname-$pkgver/LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 $pkgname-$pkgver/{AUTHORS,CHANGES,{CONTRIBUTING,README,RELEASE-NOTES}.md} -t "$pkgdir/usr/share/doc/$pkgname/"
}

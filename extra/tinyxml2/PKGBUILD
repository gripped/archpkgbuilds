# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: dhead666 <myfoolishgames@gmail.com>

pkgname=tinyxml2
pkgver=10.1.0
pkgrel=1
pkgdesc='Simple XML parser made for easy integration'
arch=('x86_64')
url='https://github.com/leethomason/tinyxml2'
license=('LicenseRef-zlib')
depends=('glibc' 'gcc-libs')
makedepends=('git' 'cmake')
source=("$pkgname::git+$url#tag=$pkgver")
sha512sums=('10f6f0241378746ab00ffaca4edc9c75d3975d57e93fbf1b62b216cd72e5e5ebfcde551155cbcf3e821d685529c958db9d8373b298c1a6de4271b7fb16a61d1a')
b2sums=('23bb925f6683d54418d81b3aae92af8bdf0fd6f82aadaa3a82ccacf3eb1daa61d2d01cfecad01193307bdded6eb1410ae16712cd609e949eadf722595e95a5f5')

build() {
  local cmake_options=(
    -B build
    -S "$pkgname"
    -D CMAKE_INSTALL_PREFIX=/usr
    -D tinyxml2_SHARED_LIBS=ON
  )

  cmake "${cmake_options[@]}"

  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgname/LICENSE.txt"
}

# vim: ts=2 sw=2 et:

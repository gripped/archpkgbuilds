# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=lib32-expat
_name=${pkgname#lib32-}
pkgver=2.7.2
pkgrel=1
pkgdesc='An XML Parser library'
arch=(x86_64)
url=https://libexpat.github.io/
_url="https://github.com/libexpat/libexpat"
license=(MIT)
depends=(
  "expat=$pkgver"
  lib32-glibc
)
makedepends=(
  cmake
  git
)
provides=(libexpat.so)
source=($_name::git+$_url?signed#tag=R_${pkgver//./_})
sha512sums=('a497cb63c23e886b2daeb9351d1efc0bb1f096a77a56afe1377560bbee936678fcf0511393a75226f6c18e80e1b4a559ba24884ad7e7f5ab5aa7f5d7a9bac087')
b2sums=('fb64f45da0db9b1f52af8efc446cd02335be8164a41c24ccf9d1ceb173007343492487988166806a9eabd420e310b2006b1f3cbeaba7d8aaaea097dc3dd5d26f')
validpgpkeys=(3176EF7DB2367F1FCA4F306B1F9B0E909AF37285) # Sebastian Pipping

build() {
  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_LIBDIR=lib32
    -D CMAKE_INSTALL_PREFIX=/usr
    -S $_name/$_name
    -W no-dev
  )

  export CC='gcc -m32'
  export CXX='c++ -m32'
  export PKG_CONFIG=i686-pc-linux-gnu-pkg-config

  cmake "${cmake_options[@]}"
  cmake --build build --verbose
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -vDm 644 $_name/$_name/COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
  rm -rf "$pkgdir"/usr/{bin,include,share/man,share/doc}
}

# vim:set sw=2 sts=-1 et:

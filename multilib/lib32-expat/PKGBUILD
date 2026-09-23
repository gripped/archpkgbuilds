# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=lib32-expat
_name=${pkgname#lib32-}
pkgver=2.8.5
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
sha512sums=('0f12690bfa10dec6075ff2f23c4c7e41e1d2e15be96a457d23fca5eb648f391a52999e8d5cb1a1f3f900f65bff22afd9e221ddf9c3af1b09866faeec2cf5d4d6')
b2sums=('3ea31c36d11aa04e5e3c68faadc16e4c01b71e70f829546d531eb6e7d2733d2cfa30fea33b4dde9fc06919982d788fc4b73ef4af7cb9d16c65687afac154053a')
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

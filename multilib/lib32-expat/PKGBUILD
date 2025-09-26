# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=lib32-expat
_name=${pkgname#lib32-}
pkgver=2.7.3
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
sha512sums=('fe186f7ab59facee6b7af1ed03df89b3c778c8d2df9325bda7253a9eec20ba6530cf91910aea380b895dc7d5150a27e824242eca38685d9cffca00e0f4c61f80')
b2sums=('5c8dfd631233e19520a19248dbe90f5413d864317d1d72a8c65b5697bee56d83a497b43165c3aafa5e635fe72f7393572e3d2d7e892de72b95e445018cad8331')
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

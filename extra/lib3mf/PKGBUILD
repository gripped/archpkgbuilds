# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Jonas Witschel <diabonas@archlinux.org>

pkgname=lib3mf
pkgver=2.3.2
pkgrel=1
pkgdesc='Implementation of the 3D Manufacturing Format file standard'
arch=('x86_64')
url='https://github.com/3MFConsortium/lib3mf'
license=('BSD-2-Clause')
depends=(
  'gcc-libs'
  'glibc'
  'libzip'
  'util-linux-libs'
  'zlib'
)
makedepends=('git' 'cmake')
checkdepends=('gtest')
replaces=('lib3mf-1')
options=('!lto')
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('97a41e0ff66e69c3e0667aa7013012b43b4cf0f4f97125f8c4be64623e420ea30fcd322390d35a9bbf60155cb31b521dd42b34d508c09dcafb2ae5392a4219ab')
b2sums=('a7f6acb1c9d535b2b504e972ec9514d037769d99d1695ae060b60a38f955c47b90de1fdcf9ca16f0ef4813719d3ff3cc2d162a4e647e3bb96c334ff49d1eda09')

build() {
  cmake \
    -B build \
    -S "$pkgname" \
    -D CMAKE_BUILD_TYPE=None \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_INSTALL_INCLUDEDIR=include/lib3mf \
    -D CMAKE_INSTALL_LIBDIR=lib \
    -D USE_INCLUDED_ZLIB=OFF \
    -D USE_INCLUDED_LIBZIP=OFF \
    -D USE_INCLUDED_GTEST=OFF \
    -D USE_INCLUDED_SSL=OFF \
    -D LIB3MF_TESTS=OFF

  cmake --build build
}

# NOTE: gtests needs C++14 and with it tests fail
# -D LIB3MF_TESTS=OFF
#check() {
#  ctest --test-dir build --output-on-failure
#}

package() {
  DESTDIR="$pkgdir" cmake --install build

  # some packages expect lib3MF.pc instead of lib3mf.pc
  ln -s lib3mf.pc "$pkgdir"/usr/lib/pkgconfig/lib3MF.pc

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgname/LICENSE"
}

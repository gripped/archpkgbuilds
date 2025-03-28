# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qt6-declarative
_pkgver=6.8.3
pkgver=${_pkgver/-/}
pkgrel=1
arch=(x86_64)
url='https://www.qt.io'
license=(GPL-3.0-only
         LGPL-3.0-only
         LicenseRef-Qt-Commercial
         Qt-GPL-exception-1.0)
pkgdesc='Classes for QML and JavaScript languages'
depends=(gcc-libs
         glibc
         qt6-base)
makedepends=(cmake
             git
             ninja
             python
             qt6-languageserver
             qt6-shadertools
             qt6-svg)
optdepends=('qt6-svg: for QtQuickVectorImage and svgtoqml')
groups=(qt6)
_pkgfn=${pkgname/6-/}
source=(git+https://code.qt.io/qt/$_pkgfn#tag=v$_pkgver)
sha256sums=('19df09f3bd3ba68412d250c86959067b7d3980283b0c44b53c976d299d0c4bb2')

build() {
  cmake -B build -S $_pkgfn -G Ninja \
    -DINSTALL_PUBLICBINDIR=usr/bin \
    -DCMAKE_MESSAGE_LOG_LEVEL=STATUS \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS -ffat-lto-objects"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

# Install symlinks for user-facing tools
  cd "$pkgdir"
  mkdir usr/bin
  while read _line; do
    ln -s $_line
  done < "$srcdir"/build/user_facing_tool_links.txt

  install -d "$pkgdir"/usr/share/licenses
  ln -s /usr/share/licenses/qt6-base "$pkgdir"/usr/share/licenses/$pkgname
}

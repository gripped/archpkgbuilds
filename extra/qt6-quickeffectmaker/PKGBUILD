# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=qt6-quickeffectmaker
_pkgver=6.8.2
pkgver=${_pkgver/-/}
pkgrel=1
arch=(x86_64)
url='https://www.qt.io'
license=(GPL-3.0-only
         LGPL-3.0-only
         LicenseRef-Qt-Commercial
         Qt-GPL-exception-1.0)
pkgdesc='Qt Quick Effect Maker (QQEM) for creating and editing custom shader effects'
depends=(gcc-libs
         glibc
         qt6-base
         qt6-declarative
         qt6-quick3d
         qt6-shadertools)
makedepends=(cmake
             git
             ninja)
groups=(qt6)
_pkgfn=${pkgname/6-/}
source=(git+https://code.qt.io/qt/$_pkgfn#tag=v$_pkgver)
sha256sums=('51a0b6c3a6ba21c303f84bc5fc347e2a936b66e3fc49b6d1968fdeb252aa1819')

build() {
  cmake -B build -S $_pkgfn -G Ninja \
    -DCMAKE_MESSAGE_LOG_LEVEL=STATUS \
    -DINSTALL_PUBLICBINDIR=usr/bin
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

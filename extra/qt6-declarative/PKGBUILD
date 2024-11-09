# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qt6-declarative
_pkgver=6.8.0
pkgver=6.8.0
pkgrel=5
arch=(x86_64)
url='https://www.qt.io'
license=(GPL3 LGPL3 FDL custom)
pkgdesc='Classes for QML and JavaScript languages'
depends=(gcc-libs
         glibc
         qt6-base)
makedepends=(cmake
             git
             ninja
             python
             qt6-languageserver
             qt6-shadertools)
groups=(qt6)
_pkgfn=${pkgname/6-/}
source=(git+https://code.qt.io/qt/$_pkgfn#tag=v$_pkgver)
sha256sums=('89b497818a0e36bf08f5a42324dcde1b441b5a0ee1c9b6cfa38fb281479de3ed')

prepare() {
  cd $_pkgfn
# Fix crashes in Plasma
  git cherry-pick -n 0ae3697cf40bcd3ae1de20621abad17cf6c5f52d
  git cherry-pick -n 861a7921ed7833a90f77b5fca436c789a4f9517c
# https://bugreports.qt.io/browse/QTBUG-127340
  git cherry-pick -n 281f620ceea03e7a222d796ae0cca917a9778368
}

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

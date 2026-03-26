# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qt6-tools
_pkgver=6.11.0
pkgver=${_pkgver/-/}
pkgrel=1
arch=(x86_64)
url='https://www.qt.io'
license=(GPL-3.0-only
         LGPL-3.0-only
         LicenseRef-Qt-Commercial
         Qt-GPL-exception-1.0)
pkgdesc='A cross-platform application and UI framework (Development Tools, QtHelp)'
depends=(gcc-libs
         glibc
         qt6-base
         zstd)
makedepends=(clang
             cmake
             git
             litehtml
             llvm
             ninja
             qt6-declarative
             vulkan-headers)
optdepends=('clang: for qdoc and lupdate'
            'litehtml: for assistant'
            'qt6-declarative: for qdistancefieldgenerator, qdoc and lupdate')
groups=(qt6)
_pkgfn=${pkgname/6-/}
source=(git+https://code.qt.io/qt/$_pkgfn#tag=v$_pkgver
        git+https://code.qt.io/playground/qlitehtml
        llvm22.patch)
sha256sums=('d440f3de6e15ae0d90b4de25fbfe6bad4ccb4c6be018d63a95e5cc4e6adcbe11'
            'SKIP'
            '5f5dcc9234a19a2d545698406ee5dd5c3655d8cf3310e446a57d6d0738dc8e2e')

prepare() {
  cd $_pkgfn
  git submodule init
  git submodule set-url src/assistant/qlitehtml "$srcdir"/qlitehtml
  git -c protocol.file.allow=always submodule update
  patch -Np1 < ../llvm22.patch
}

build() {
  cmake -B build -S $_pkgfn -G Ninja \
    -DQT_INSTALL_XDG_DESKTOP_ENTRIES=ON \
    -DQLITEHTML_USE_SYSTEM_LITEHTML=ON \
    -DCMAKE_MESSAGE_LOG_LEVEL=STATUS
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -d "$pkgdir"/usr/share/licenses
  ln -s /usr/share/licenses/qt6-base "$pkgdir"/usr/share/licenses/$pkgname
}

# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Imanol Celaya <ornitorrincos@archlinux-es.org>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Dan Vratil <progdan@progdansoft.com>
# Contributor: thotypous <matiasΘarchlinux-br·org>
# Contributor: delor <bartekpiech gmail com>

pkgbase=qtcreator
pkgname=(qtcreator
         qtcreator-devel)
pkgver=20.0.0
pkgrel=1
pkgdesc='Lightweight, cross-platform integrated development environment'
arch=(x86_64)
url='https://www.qt.io'
license=(GPL-3.0-only)
depends=(clang
         clazy
         glib2
         glibc
         libarchive
         libelf
         libgcc
         libstdc++
         litehtml0.9
         llvm-libs
         python
         qt6-base
         qt6-charts
         qt6-declarative
         qt6-quick3d
         qt6-quicktimeline
         qt6-tools
         qt6-serialport
         qt6-svg
         qt6-webengine
         sh
         yaml-cpp
         zstd)
# syntax-highlighting
makedepends=(cmake
             git
             go
             llvm)
optdepends=('qt6-doc: integrated Qt documentation'
            'qt6-examples: welcome page examples'
            'gdb: debugger'
            'cmake: cmake project support'
            'x11-ssh-askpass: ssh support'
            'git: git support'
            'mercurial: mercurial support'
            'breezy: bazaar support'
            'valgrind: analyze support'
            'perf: performer analyzer'
            'mlocate: locator filter')
source=(git+https://code.qt.io/qt-creator/qt-creator#tag=v$pkgver
        git+https://code.qt.io/qt-creator/perfparser
        git+https://code.qt.io/playground/qlitehtml)
sha256sums=('22c9cb5ee0d2a17b3aa536bf16f83d199b5084625447bb40a46e41786ecb660c'
            'SKIP'
            'SKIP')
options=(docs)

prepare() {
  cd qt-creator
  git submodule set-url src/tools/perfparser "$srcdir"/perfparser
  git submodule set-url src/libs/qlitehtml "$srcdir"/qlitehtml
  git -c protocol.file.allow=always submodule update --init src/libs/qlitehtml src/tools/perfparser

# Fix doc build with system litehtml
  rm src/libs/qlitehtml/src/3rdparty/qt_attribution.json
# Drop unneeded litehtml include
  sed -e '/litehtml\/types.h/d' -i src/libs/qlitehtml/src/container_qpainter_p.h
}

build() {
  cmake -B build -S qt-creator \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DWITH_DOCS=ON \
    -DBUILD_DEVELOPER_DOCS=ON \
    -DQTC_CLANG_BUILDMODE_MATCH=ON \
    -DCLANGTOOLING_LINK_CLANG_DYLIB=ON \
    -DQLITEHTML_USE_SYSTEM_LITEHTML=ON \
    -Dlitehtml_DIR=/usr/lib/cmake/litehtml0.9
  cmake --build build
  cmake --build build --target docs
}

package_qtcreator() {
  DESTDIR="$pkgdir" cmake --install build
# Install docs
  cp -r build/share/doc "$pkgdir"/usr/share

  install -Dm644 qt-creator/LICENSES/* -t "$pkgdir"/usr/share/licenses/qtcreator
}

package_qtcreator-devel() {
  pkgdesc+=' (development files)'
  depends=(qtcreator)
  optdepends=()

  DESTDIR="$pkgdir" cmake --install build --component Devel
}

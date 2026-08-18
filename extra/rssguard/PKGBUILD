# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: Alois Nespor <info@aloisnespor.info>
# Contributor: speps <speps dot aur dot archlinux dot org>

pkgname=rssguard
pkgver=5.2.4
pkgrel=1
pkgdesc='Simple (yet powerful) Qt feed reader'
arch=(x86_64)
url='https://github.com/martinrotter/rssguard'
license=(GPL-3.0-only)
depends=(glibc
         libgcc
         libglvnd
         libstdc++
         mpv
         qt6-base
         qt6-declarative
         qt6-multimedia
         qt6-webengine)
makedepends=(cmake
             git
             go
             qt6-tools)
optdepends=('clang: Support for beautification of message filter scripts'
            'mariadb-libs: Support for MariaDB-based data storage')
conflicts=(rssguard-lite)
replaces=(rssguard-lite)
source=(git+https://github.com/martinrotter/rssguard#tag=$pkgver
        git+https://github.com/martinrotter/qtlinq
        git+https://codeberg.org/gumbo-parser/gumbo-parser
        git+https://github.com/martinrotter/qt-publicsuffix)
sha256sums=('9f7bee387d7640060714c46cc6c7c8b003ba506c087bda3b1d214f9e277e7704'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd $pkgname
  git submodule init
  git submodule set-url src/librssguard/3rd-party/gumbo "$srcdir"/gumbo-parser
  git submodule set-url src/librssguard/3rd-party/qtlinq "$srcdir"/qtlinq
  git submodule set-url src/librssguard/3rd-party/qt-publicsuffix "$srcdir"/qt-publicsuffix
  git -c protocol.file.allow=always submodule update src/librssguard/3rd-party/qtlinq src/librssguard/3rd-party/gumbo src/librssguard/3rd-party/qt-publicsuffix
}

build() {
  cmake -B build -S $pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

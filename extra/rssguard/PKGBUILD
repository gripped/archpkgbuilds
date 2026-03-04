# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: Alois Nespor <info@aloisnespor.info>
# Contributor: speps <speps dot aur dot archlinux dot org>

pkgname=rssguard
pkgver=5.0.2
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
         qt6-multimedia)
makedepends=(cmake
             git
             go
             qt6-tools)
optdepends=('clang: Support for beautification of message filter scripts'
            'mariadb-libs: Support for MariaDB-based data storage')
conflicts=(rssguard-lite)
replaces=(rssguard-lite)
source=(git+https://github.com/martinrotter/rssguard#tag=$pkgver
        git+https://github.com/litehtml/litehtml.git
        git+https://github.com/martinrotter/qtlinq)
sha256sums=('203cea60907ab7e7765c4df612e4f6f64ba7b665417f091512c3a930529af872'
            'SKIP'
            'SKIP')

prepare() {
  cd $pkgname
  git submodule init
  git submodule set-url src/librssguard/3rd-party/qtlinq "$srcdir"/qtlinq
  git submodule set-url src/librssguard/3rd-party/litehtml "$srcdir"/litehtml
  git -c protocol.file.allow=always submodule update src/librssguard/3rd-party/qtlinq src/librssguard/3rd-party/litehtml
}

build() {
  cmake -B build -S $pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS -I /usr/include/litehtml"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: Alois Nespor <info@aloisnespor.info>
# Contributor: speps <speps dot aur dot archlinux dot org>

pkgbase=rssguard
pkgname=(rssguard{,-lite})
pkgver=4.8.6
pkgrel=1
pkgdesc='Simple (yet powerful) Qt feed reader'
arch=(x86_64)
url='https://github.com/martinrotter/rssguard'
license=(GPL-3.0-only)
depends=(gcc-libs
         glibc
         libglvnd
         mpv
         qt6-5compat
         qt6-base
         qt6-declarative
         qt6-multimedia
         sqlite)
makedepends=(cmake
             git
             qt6-tools
             qt6-webengine)
optdepends=('clang: Support for beautification of message filter scripts'
            'mariadb-libs: Support for MariaDB-based data storage')
source=(git+https://github.com/martinrotter/rssguard#tag=$pkgver)
sha256sums=('5ade476e36a2e00191ec54d913dd6ab865406f0e62eba994b4fb1e4fcb37b783')

build() {
  cmake -B build -S $pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build

  cmake -B build-lite -S $pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DNO_LITE=OFF
  cmake --build build-lite
}

package_rssguard() {
  depends+=(qt6-webengine)

  DESTDIR="$pkgdir" cmake --install build
}

package_rssguard-lite() {
  pkgdesc+=' without WebEngine support'
  conflicts=(rssguard)
  provides=(rssguard=$pkgver)
  replaces=(rssguard-nowebengine)

  DESTDIR="$pkgdir" cmake --install build-lite
}

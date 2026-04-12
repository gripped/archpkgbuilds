# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=frei0r-plugins
pkgver=3.1.0
pkgrel=1
pkgdesc='Collection of video effect plugins'
arch=(x86_64)
url='https://frei0r.dyne.org/'
license=(GPL-2.0-or-later)
depends=(
  cairo
  gavl
  glibc
  libgcc
  libstdc++
  opencv
)
makedepends=(
  cmake
  git
)
source=("git+https://github.com/dyne/frei0r#tag=v$pkgver")
b2sums=('cefc0ebffbd223d7c8a8a2062ecb4910abed31c7cda0dc1c13d5a726fb89c87a37093530d269843ddf557cafb24a650f56a04822bf714578c2b08f9d1e186818')
validpgpkeys=(6113D89CA825C5CEDD02C87273B35DA54ACB7D10) # Denis Roio (Jaromil)

build() {
  cmake -S frei0r -B build \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

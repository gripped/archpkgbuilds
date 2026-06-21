# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=frei0r-plugins
pkgver=3.2.2
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
b2sums=('6c69ad337cd10480ade091fffba8c9e32b18cd5acae70131aa4f99b832dd217c13b319dfadead5d04ad960871a4bb02379b29b42479969766e68821fd0151944')
validpgpkeys=(6113D89CA825C5CEDD02C87273B35DA54ACB7D10) # Denis Roio (Jaromil)

build() {
  cmake -S frei0r -B build \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

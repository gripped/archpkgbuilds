# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=frei0r-plugins
pkgver=2.5.4
pkgrel=1
pkgdesc='Collection of video effect plugins'
arch=(x86_64)
url='https://frei0r.dyne.org/'
license=(GPL-2.0-or-later)
depends=(
  glibc
  libgcc
  libstdc++
)
makedepends=(
  cairo
  cmake
  gavl
  git
  opencv
)
optdepends=(
  'cairo: cairoaffineblend, cairoblend, cairogradient, cairoimagegrid and mirr0r plugins'
  'gavl: rgbparade, scale0tilt and vectorscope plugins'
  'opencv: facebl0r and facedetect plugins'
)
source=("git+https://github.com/dyne/frei0r#tag=v$pkgver")
b2sums=('08b99d438f97547f0f15d036d3fee2cf967fda7de95d7b72e77c9289b4ea782786fa41cfdc0b58f1902300434cedcef4c22b3f5072784be8e7100bdd2b8425f4')
validpgpkeys=(6113D89CA825C5CEDD02C87273B35DA54ACB7D10) # Denis Roio (Jaromil)

build() {
  cmake -S frei0r -B build \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=frei0r-plugins
pkgver=2.5.2
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
b2sums=('82a06b4885cfb29c2e9274c32e83b157bfa714e998c9036dd4a3cc6697653ed5106a3886a85a619ac179508644e098fd3951578677cecfd6e01061b21e63d171')
validpgpkeys=(6113D89CA825C5CEDD02C87273B35DA54ACB7D10) # Denis Roio (Jaromil)

build() {
  cmake -S frei0r -B build \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

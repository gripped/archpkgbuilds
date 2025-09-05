# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=frei0r-plugins
pkgver=2.4.0
pkgrel=1
pkgdesc='Collection of video effect plugins'
arch=(x86_64)
url='https://frei0r.dyne.org/'
license=(GPL-2.0-or-later)
depends=(
  gcc-libs
  glibc
)
makedepends=(
  cairo
  cmake
  gavl
  git
  ninja
  opencv
)
optdepends=(
  'cairo: cairoaffineblend, cairoblend, cairogradient and cairoimagegrid plugins'
  'gavl: rgbparade, scale0tilt and vectorscope plugins'
  'opencv: facebl0r and facedetect plugins'
)
source=("git+https://github.com/dyne/frei0r#tag=v$pkgver")
b2sums=(0a79a0913ce69814a01e37204233813fcd566bf2df4b3d97da9161c397b66a1e8f52eccbe4d27f34f3a5d1cffd6a22cf4fbacbe28fdc39331c27d9d294d59a5b)
validpgpkeys=(6113D89CA825C5CEDD02C87273B35DA54ACB7D10) # Denis Roio (Jaromil)

build() {
  cmake -S frei0r -B build -G Ninja \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

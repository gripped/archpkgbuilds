# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=frei0r-plugins
pkgver=3.0.0
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
b2sums=('4ef72aa8cc09e16d93780e1d71e4bb5d01e9c53393bbc6e1394b399c29f28ed6d9bc53f3dcb5899181075d0cdc22f5fbd287c29e8cde030c465672eef3cad654')
validpgpkeys=(6113D89CA825C5CEDD02C87273B35DA54ACB7D10) # Denis Roio (Jaromil)

build() {
  cmake -S frei0r -B build \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=frei0r-plugins
pkgver=3.4.0
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
source=("git+https://github.com/dyne/frei0r#tag=v$pkgver"
         opencv-5.patch)
b2sums=('8799c25e2ee7b4531d91cfa05cbcded0aa07315ea6978cafeae391989bf95d485b7afca0afab68ecea843583c79502af625bc51c644700cbba09f88e9fcbc411'
        '8a4d4b1e87b5c5ba553a687dc74d6d8b7af1566fba5ed59175cc9867894f0776442acfff8d0dbebe5b72a1f23ad8de80bd8853bfc4f024a250e6c666b28b5384')
validpgpkeys=(6113D89CA825C5CEDD02C87273B35DA54ACB7D10) # Denis Roio (Jaromil)

prepare() {
  patch -d frei0r -p1 < opencv-5.patch
}

build() {
  cmake -S frei0r -B build \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=libxisf
pkgver=0.2.13
pkgrel=1
pkgdesc='Library to load and write XISF format from PixInsight'
url='https://gitea.nouspiro.space/nou/libXISF'
license=(GPL-3.0-only)
arch=(x86_64)
depends=(gcc-libs
         glibc
         lz4
         pugixml
         zlib
         zstd)
makedepends=(cmake
             git)
source=(git+https://gitea.nouspiro.space/nou/libXISF#tag=v$pkgver)
sha256sums=('bce61a75d4a745714f0ba925bf6082d566050b11f045bb1e30d9bfe74a48bc0b')

build() {
  cmake -B build -S libXISF \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_BUNDLED_LIBS=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

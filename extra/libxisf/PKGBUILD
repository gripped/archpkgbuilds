# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=libxisf
pkgver=0.2.17
pkgrel=1
pkgdesc='Library to load and write XISF format from PixInsight'
url='https://gitea.nouspiro.space/nou/libXISF'
license=(GPL-3.0-only)
arch=(x86_64)
depends=(glibc
         libgcc
         libstdc++
         lz4
         pugixml
         zlib
         zstd)
makedepends=(cmake
             git)
source=(git+https://gitea.nouspiro.space/nou/libXISF#tag=v$pkgver)
sha256sums=('b861cb56f972718fc2761141a6c98b53da65c10db67df773158cb67480290a14')

build() {
  cmake -B build -S libXISF \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_BUNDLED_LIBS=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

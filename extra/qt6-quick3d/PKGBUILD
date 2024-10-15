# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qt6-quick3d
_pkgver=6.8.0
pkgver=6.8.0
pkgrel=1
arch=(x86_64)
url='https://www.qt.io'
license=(GPL3)
pkgdesc='Qt module and API for defining 3D content in Qt Quick'
depends=(gcc-libs
         glibc
         openxr
         qt6-base
         qt6-declarative
         qt6-quicktimeline
         qt6-shadertools
         zlib)
makedepends=(assimp
             cmake
             git
             ninja)
optdepends=('assimp: assimp import plugin')
groups=(qt6)
_pkgfn=${pkgname/6-/}
source=(git+https://code.qt.io/qt/$_pkgfn#tag=v$_pkgver)
sha256sums=('83be32b96d9c868be71175914e10f2d2d8a8dc033e4698bccb9ea81cab872a09')

build() {
  cmake -B build -S $_pkgfn -G Ninja \
    -DCMAKE_MESSAGE_LOG_LEVEL=STATUS
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -d "$pkgdir"/usr/share/licenses
  ln -s /usr/share/licenses/qt6-base "$pkgdir"/usr/share/licenses/$pkgname
}

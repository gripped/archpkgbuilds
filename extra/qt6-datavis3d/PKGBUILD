# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=qt6-datavis3d
_pkgver=6.8.0
pkgver=6.8.0
pkgrel=1
arch=(x86_64)
url='https://www.qt.io'
license=(GPL3 LGPL3 FDL custom)
pkgdesc='Qt6 Data Visualization module'
depends=(gcc-libs
         glibc
         qt6-base)
makedepends=(cmake
             git
             ninja
             qt6-declarative)
optdepends=('qt6-declarative: QML bindings')
groups=(qt6)
_pkgfn=${pkgname/6-/}
source=(git+https://code.qt.io/qt/$_pkgfn#tag=v$_pkgver)
sha256sums=('2f9586a77cb61a04799507551e96c2d798913a5eb29012b88b2641949479a1e0')

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

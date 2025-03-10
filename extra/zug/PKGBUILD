# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=zug
pkgver=0.1.1
pkgrel=2
pkgdesc='Transducers for C++'
arch=(any)
url='https://sinusoid.es/zug/'
license=(BSL-1.0)
makedepends=(catch2
             cmake
             git)
source=(git+https://github.com/arximboldi/zug#tag=v$pkgver)
sha256sums=('8e0347010e7e1a36865e2729f33ece20bae87f8db46ebaf12d16d174d8203392')

prepare() {
  cd $pkgname
  git cherry-pick -n c8c74ada30d931e40636c13763b892f20d3ce1ae # Add missing include
}

build() {
  cmake -B build -S $pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

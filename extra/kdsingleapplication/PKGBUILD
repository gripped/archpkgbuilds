# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kdsingleapplication
pkgver=1.2.0
pkgrel=1
pkgdesc="KDAB's helper class for single-instance policy applications"
arch=(x86_64)
url='https://github.com/KDAB/KDSingleApplication'
license=(MIT)
depends=(gcc-libs
         glibc
         qt6-base)
makedepends=(cmake
             git)
source=(git+https://github.com/KDAB/KDSingleApplication#tag=v$pkgver)
sha256sums=('bfd4df2db09cf1dac6e14b38e78f9897925b3eb98272a8962eab7f0b0c6e941e')

build() {
  cmake -B build -S KDSingleApplication \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDSingleApplication_QT6=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 KDSingleApplication/LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname
}

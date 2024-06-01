# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=minizip-ng
pkgver=4.0.6
pkgrel=1
pkgdesc='Fork of the popular zip manipulation library found in the zlib distribution'
arch=(x86_64)
url='https://github.com/zlib-ng/minizip-ng'
license=(Zlib)
depends=(bzip2
         glibc
         openssl
         xz
         zlib
         zstd)
makedepends=(cmake
             git)
source=(git+https://github.com/zlib-ng/minizip-ng#tag=$pkgver)
sha256sums=('88b59a3cd5322c7b8c164f2841764a6eadc8283679feacdb88bf7d2223b3c723')

build() {
  cmake -B build -S $pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DMZ_LIB_SUFFIX="-ng" \
    -DBUILD_SHARED_LIBS=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $pkgname/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}

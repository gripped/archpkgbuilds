# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=minizip-ng
pkgver=4.0.2
pkgrel=1
pkgdesc='Fork of the popular zip manipulation library found in the zlib distribution'
arch=(x86_64)
url='https://github.com/zlib-ng/minizip-ng'
license=(custom)
depends=(bzip2
         glibc
         openssl
         xz
         zlib
         zstd)
makedepends=(cmake)
source=(https://github.com/zlib-ng/minizip-ng/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('22008b4639197edfc3c5797c8bd1d7a3b2e684bf669a26834faf12b4026dba1c')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DMZ_LIB_SUFFIX="-ng" \
    -DBUILD_SHARED_LIBS=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $pkgname-$pkgver/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}

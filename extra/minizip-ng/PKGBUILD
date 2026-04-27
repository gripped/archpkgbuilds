# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=minizip-ng
pkgver=4.2.0
pkgrel=1
pkgdesc='Fork of the popular zip manipulation library found in the zlib distribution'
arch=(x86_64)
url='https://github.com/zlib-ng/minizip-ng'
license=(Zlib)
depends=(bzip2
         glibc
         openssl
         xz
         zlib-ng
         zstd)
makedepends=(cmake
             git)
source=(git+https://github.com/zlib-ng/minizip-ng#tag=$pkgver)
sha256sums=('ec2d0f6b317bf623986d63bbf86146d0663bc47b72699ea4c71d875e6f4190d8')

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

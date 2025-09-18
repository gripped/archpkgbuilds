# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=blosc2
_pkgname=c-blosc2
pkgver=2.21.2
pkgrel=1
pkgdesc="A fast, compressed, persistent binary data store library for C."
arch=(x86_64)
url="https://www.blosc.org"
license=(BSD-3-Clause)
depends=(
  glibc
  lz4
  zlib
  zstd
)
makedepends=(cmake)
provides=(libblosc2.so)
source=("https://github.com/Blosc/c-blosc2/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('744f0c0b7e33c9c1982f908273135e0347a2cde132f216de953cc8148e85c40828568b120d53fb62097fad459cf89adadbc66d8883d3f2e23093da8ae03eb62c')
b2sums=('6634af615117f0890c19be92f08d1530151322636cefb79adfe560ed58c9303febd588f0d0c9ecad7536243c26b49d3eb1ec5c54157019262f9856bbc8efcb70')

build() {
  cmake -B build -S $_pkgname-$pkgver \
    -D CMAKE_BUILD_TYPE=None \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D PREFER_EXTERNAL_LZ4=ON \
    -D PREFER_EXTERNAL_ZLIB=ON \
    -D PREFER_EXTERNAL_ZSTD=ON \
    -D BUILD_STATIC=OFF \
    -W no-dev
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" $_pkgname-$pkgver/LICENSE.txt
}

# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=blosc2
_name=c-blosc2
pkgver=2.18.0
pkgrel=1
pkgdesc="A fast, compressed, persistent binary data store library for C."
arch=(x86_64)
url="https://www.blosc.org"
license=(BSD-3-Clause)
depends=(glibc lz4 zlib zstd)
makedepends=(cmake)
source=("https://github.com/Blosc/$_name/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('78c9795ba00fde0ac9e5831646984e11867a76a28bae9f9069afeffc8841d03ad31ff54b833ab183485260109aee872119a52403b31f579549701b87f84ba52d')
b2sums=('a5c072e7ec337b1ecc73e2d9a6fd5272af3c08200af52e3b539142eb1d26bf684669a3f97298173b5d281c97def0f91a4df2104e738e45db832b6d688a3b24aa')

build() {
  cmake -B build -S $_name-$pkgver \
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
  install -vDm644 $_name-$pkgver/LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}

# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=blosc2
_name=c-blosc2
pkgver=2.19.0
pkgrel=1
pkgdesc="A fast, compressed, persistent binary data store library for C."
arch=(x86_64)
url="https://www.blosc.org"
license=(BSD-3-Clause)
depends=(glibc lz4 zlib zstd)
makedepends=(cmake)
source=("https://github.com/Blosc/$_name/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('92a92f251666238e741970b1ec7a46213d0755543e29ee160a2b20ba0b36aade7cc8971e5df7ea1aefe62c32b765efbcd60b6b20d7f697f086f6004ed65bd2a1')
b2sums=('44ef2150bf618c1bac1ff9000f6f12ae3e6310026a82eac6efb26bc96ef4e3c7ec40d59d18c75c4e801ede5acce14c71403b230ca436b4efa0db3550902bb490')

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

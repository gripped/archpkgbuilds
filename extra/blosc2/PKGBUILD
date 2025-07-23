# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=blosc2
_pkgname=c-blosc2
pkgver=2.19.1
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
source=("https://github.com/Blosc/c-blosc2/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('f57959e96a48598e00e327fdc7d4c692116870cdd57fb36b65d783ee8a6a451bff9580bb4e43a428bf17b8eed364a269b702ec610c8d0c3569d6c3af466a3ac3')
b2sums=('e57059d990d86e6cebaebf38931e6a6ad1c1d17339b5b4600484012011cd8bd4bf0f2b1a63a07d11b4080f23f45d354d656cf9b8c02d41b1ebfd7a1e2f532bfd')

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

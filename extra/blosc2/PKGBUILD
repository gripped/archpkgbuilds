# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=blosc2
_pkgname=c-blosc2
pkgver=2.21.3
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
sha512sums=('521dd7342d5a9a734487b23857c9f2fb8e45e5498c79291582a43e829693f7c4a882aea1aedc48ffc3b4e269357a9b787e5f9969c4494dd97a1d27c2838a2b7d')
b2sums=('65a30f2838c7e393d37ea4e6795a9a188c2177d0b69d5bfb480e1ca40fdcb2fb07172848eee8fa01873f422ed8198fe444ee50aa8de392d91924187c85d0673d')

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

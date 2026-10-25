# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: TingPing <tingping@tingping.se>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=lib32-brotli
pkgver=1.2.1
pkgrel=1
pkgdesc='Generic-purpose lossless compression algorithm (32-bit)'
arch=(x86_64)
license=(MIT)
url=https://github.com/google/brotli
depends=(
  brotli
  lib32-gcc-libs
)
makedepends=(
  cmake
  git
)
provides=(
  libbrotli{common,dec,enc}.so
)
source=(git+https://github.com/google/brotli#tag=v$pkgver)
sha512sums=('5b75c0bd67e47441aac8d8e67b4f2416f06c2f5e4fb09f1f213ccf313d00a9d08dfda42d59f5133884f980ea712509bbc6f26f4e942316352eb4150b2f16e964')

build() {
  export CC='gcc -m32'
  export PKG_CONFIG=i686-pc-linux-gnu-pkg-config

  cmake -S brotli -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=True \
    -DCMAKE_C_FLAGS="$CFLAGS -ffat-lto-objects" \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib32 \
    -DBROTLI_BUILD_TOOLS=OFF
  cmake --build build -v
}

check() {
  cd build
  ctest --output-on-failure --stop-on-failure -j$(nproc)
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  rm -rf "${pkgdir}"/usr/{bin,include,lib32/*.a,share}
  install -dm 755 "${pkgdir}"/usr/share/licenses
  ln -s brotli "${pkgdir}"/usr/share/licenses/lib32-brotli
}

# vim:set sw=2 sts=-1 et:

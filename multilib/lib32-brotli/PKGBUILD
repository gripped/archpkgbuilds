# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: TingPing <tingping@tingping.se>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=lib32-brotli
pkgver=1.1.0
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
_tag=ed738e842d2fbdf2d6459e39267a633c4a9b2f5d
source=(git+https://github.com/google/brotli#tag=${_tag})
sha512sums=('SKIP')

pkgver() {
  cd brotli
  git describe --tags --match 'v*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export CC='gcc -m32'
  export PKG_CONFIG=i686-pc-linux-gnu-pkg-config

  cmake -S brotli -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=True \
    -DCMAKE_C_FLAGS="$CFLAGS -ffat-lto-objects" \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib32
  cmake --build build -v
}

check() {
  cd build
  ctest --output-on-failure --stop-on-failure -j$(nproc)
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  rm -rf "${pkgdir}"/usr/{bin,include,lib32/*.a}
  install -dm 755 "${pkgdir}"/usr/share/licenses
  ln -s brotli "${pkgdir}"/usr/share/licenses/lib32-brotli
}

# vim:set sw=2 sts=-1 et:

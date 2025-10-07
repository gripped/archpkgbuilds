# Maintainer: Brett Cornwall <ainola@archlinux.org>
# Contributor: Luca Weiss
# Contributor: Michael Yang

pkgname=spdlog
pkgver=1.15.3
pkgrel=3
pkgdesc='Very fast, header-only/compiled, C++ logging library'
arch=('x86_64')
url='https://github.com/gabime/spdlog'
license=('MIT')
depends=(
  'gcc-libs'
  'glibc'
  'libfmt.so'
)
makedepends=(
  'cmake'
  'catch2'
)
provides=('libspdlog.so')
source=(
  "$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
  "$url/commit/b77a2cab5b1e6710ec55e6a4484f43278fc0036b.patch"
  "spdlog_fmt_external.patch"
)
sha256sums=('15a04e69c222eb6c01094b5c7ff8a249b36bb22788d72519646fb85feb267e67'
            '30cabfd9162e47dec40f24328d6bc85dc67ed4b4e2e07c300f66aeffd03f3f57'
            'a0eb34b7c6920f0db2587460071f53372663c191cdfe34bf5ea2704c309c745f')

prepare() {
  cd "$pkgname-$pkgver"
  # Catch2 3.9+ compatibility, see:
  # https://github.com/gabime/spdlog/pull/3451
  patch -p1 < ../b77a2cab5b1e6710ec55e6a4484f43278fc0036b.patch
  patch -p1 < ../spdlog_fmt_external.patch
}

build() {
  cmake -B build -S "$pkgname-$pkgver" \
    -DSPDLOG_BUILD_BENCH=OFF \
    -DSPDLOG_FMT_EXTERNAL=ON \
    -DSPDLOG_BUILD_SHARED=ON \
    -DSPDLOG_BUILD_TESTS=ON \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -Wno-dev
  cmake --build build
}

check() {
  cmake --build build --target test
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -vDm644 "$pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}

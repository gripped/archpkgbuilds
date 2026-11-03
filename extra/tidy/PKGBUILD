# Maintainer:
# Contributor: eric <eric@archlinux.org>
# Contributor: Markus Meissner <markus@meissna.de>

pkgname=tidy
pkgver=5.8.0
pkgrel=4
pkgdesc="A tool to tidy down your HTML code to a clean style"
arch=(x86_64)
url="https://www.html-tidy.org/"
license=(custom)
depends=(glibc)
makedepends=(cmake git libxslt)
conflicts=(tidyhtml)
provides=(tidyhtml)
replaces=(tidyhtml)
source=("git+https://github.com/htacg/tidy-html5.git#tag=$pkgver")
sha512sums=('f1618ee2ec72e2e635c4d529b19c2d08eb7a47c6daf5639677b1bcb4e32ce50ffe277ef3cf33cf1f476dc0211ee912c0fda33e9699ca0b5e1a803eb5381c9736')

prepare() {
  mkdir -p build
  sed -i 's/cmake_minimum_required (VERSION 2.8.12)/cmake_minimum_required (VERSION 3.5)/' tidy-html5/CMakeLists.txt
}

build() {
  cd build
  export CFLAGS+=" -ffat-lto-objects"
  export CXXFLAGS+=" -ffat-lto-objects"
  cmake ../tidy-html5 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install

# Compatibility symlinks until everything is ported
  ln -s tidybuffio.h "$pkgdir"/usr/include/buffio.h
  ln -s tidyplatform.h "$pkgdir"/usr/include/platform.h

  install -Dm644 "$srcdir"/tidy-html5/README/LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

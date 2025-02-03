# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=ccache
pkgver=4.10.2
pkgrel=3
pkgdesc='Compiler cache that speeds up recompilation by caching previous compilations'
url='https://ccache.dev/'
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=(
  'fmt'
  'gcc-libs'
  'glibc'
  'hiredis'
  'libblake3'
  'libxxhash.so'
  'libzstd.so'
  'xxhash'
  'zstd'
)
makedepends=(
  'asciidoctor'
  'cmake'
  'perl'
  'tl-expected'
)
checkdepends=('doctest')
source=(https://github.com/ccache/ccache/releases/download/v${pkgver}/ccache-${pkgver}.tar.xz{,.asc})
sha512sums=('3815c71d7266c32839acb306763268018acc58b3bbbd9ec79fc101e4217c1720d2ad2f01645bf69168c1c61d27700b6f3bb755cfa82689cca69824f015653f3c'
            'SKIP')
b2sums=('7352b8b48ed889e1f251ae59cb7cd9d01d7d3226b58a7823be176907dc074ff22ca5d6a271e2caede7d97a65457b9067b48e9d39ab833bf45fb055eb3bfe7607'
        'SKIP')
validpgpkeys=('5A939A71A46792CF57866A51996DDA075594ADB8') # Joel Rosdahl <joel@rosdahl.net>

build() {
  cd ${pkgname}-${pkgver}
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -Wno-dev \
    -B build \
    -S .
  cmake --build build
  cmake --build build --target doc
}

check() {
  cd ${pkgname}-${pkgver}
  ctest --test-dir build --output-on-failure
}

package() {
  cd ${pkgname}-${pkgver}

  make DESTDIR="${pkgdir}" install -C build
  make DESTDIR="${pkgdir}" install -C build/doc

  install -vDm 644 doc/*.md doc/*.adoc -t "${pkgdir}/usr/share/doc/${pkgname}"

  install -vd "${pkgdir}/usr/lib/ccache/bin"
  local _prog
  for _prog in gcc g++ c++; do
    ln -vs /usr/bin/ccache "${pkgdir}/usr/lib/ccache/bin/$_prog"
    ln -vs /usr/bin/ccache "${pkgdir}/usr/lib/ccache/bin/${CHOST}-$_prog"
  done
  for _prog in cc clang clang++; do
    ln -vs /usr/bin/ccache "${pkgdir}/usr/lib/ccache/bin/$_prog"
  done
}

# vim: ts=2 sw=2 et:

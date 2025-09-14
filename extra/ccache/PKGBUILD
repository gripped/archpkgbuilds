# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=ccache
pkgver=4.12
pkgrel=1
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
source=(https://github.com/ccache/ccache/releases/download/v${pkgver}/ccache-${pkgver}.tar.xz{,.minisig})
sha512sums=('c7b9516dd11507f603b27dc0c23c3c21f133a23cad2e4f4eb3b0405f055034ea85e9728015bff295312c3c86bcfa54efcedc513615b4284c2b1ba8ca5bdb3ff2'
            '4e1e12b49b88881f8ba44795631d8598dedfcf0ac0c72d4ff4d27d87f649a1689c15ea43a52912c226e384ae35268a68feed90ce70abe29feb29c8a71a376713')
b2sums=('91292a9c6978d6bd5a22d10bdfe14ce2f105d2a19d9c6921a7b6b230aa477786483e0e4f0de98f4bcf25cb2fe64899a2cf9c8bf0f8957814af5bb6c40cc7d1ac'
        'ce5541b9d2f34b644b03121129ed9812064c910b403b05495d552031090a6cc807d4f6bcd4edc53604c60296b4e411c6909479c44062f1638afe5fc84baf978a')
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

  install -vdm 755 "${pkgdir}/usr/lib/ccache/bin"
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

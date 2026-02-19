# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=ccache
pkgver=4.12.3
pkgrel=2
pkgdesc='Compiler cache that speeds up recompilation by caching previous compilations'
url='https://ccache.dev/'
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=(
  'fmt'
  'glibc'
  'hiredis'
  'libblake3'
  'libgcc'
  'libstdc++'
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
sha512sums=('6745a6dc002e8cca802d2559993d88028fc138d25a079efbc7bb6d4b39e09b2f46eeb1c5aa857f34fc45b7e8f9cfa6764b412b0e96c7f12225083a29c0cde314'
            '0c2334642f8ac15093b6838f9cea881960acb175e5418f1e8f54f11a8a3ace3784daf1489e7adff29198bc46704ac62db13a8d4f29e2c66cdc52383ccbe3e2da')
b2sums=('f15d68b7f3fc457b967c76ee068c1f16cd5e210aa51b56d9672d43df0c7faf8e07cecb987cf0c13228e764431f170068d2f422f0f213ec66bd7a19f7adf4b594'
        'a087a330e15567ee16541cd92df9defbb477e459407dfe78b642cfbf4bbb9741c91b32951f9cea0423a387ad487710747d5ba6e3bcf10f1523c5301ab3c37f85')
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

# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Sam Stuewe <halosghost at archlinux dot info>

pkgname=hashcat
pkgver=8.0.0
pkgrel=1
epoch=1
pkgdesc='Multithreaded advanced password recovery utility'
url='https://hashcat.net/hashcat'
arch=('x86_64')
depends=(
  clang-libs
  minizip
  ocl-icd
  xxhash
  zlib
)
makedepends=(
  opencl-headers
  rust
)
provides=('libhashcat.so')
license=('MIT')
source=(
  https://hashcat.net/files/${pkgname}-${pkgver}.tar.gz{,.asc}
)
sha512sums=('8059a20d59852d1bcfcbcd4f36825b71568000c87e3d821e67dd115e17aeecd43d346072a7aee5d6c4de05dccbb395462f6a12c7481691ea60d5ffe3de5e08f3'
            'SKIP')
validpgpkeys=('A70833229D040B4199CC00523C17DA8B8A16544F') # Hashcat signing key <signing@hashcat.net>

prepare() {
  cd ${pkgname}-${pkgver}
  sed -ri 's!^(HASHCAT_ROOT=).*!\1\"/usr/bin\"!' extra/tab_completion/${pkgname}.sh
}

build() {
  cd ${pkgname}-${pkgver}
  rm -rf deps/{OpenCL-Headers,xxHash}
  export CFLAGS+=" ${CPPFLAGS}"
  export CXXFLAGS+=" ${CPPFLAGS}"
  make \
    PREFIX=/usr \
    SHARED=1 \
    MAINTAINER_MODE=1 \
    USE_SYSTEM_XXHASH=1 \
    USE_SYSTEM_OPENCL=1 \
    USE_SYSTEM_ZLIB=1
}

package() {
  cd ${pkgname}-${pkgver}
  make \
    DESTDIR="${pkgdir}" \
    PREFIX=/usr \
    SHARED=1 \
    MAINTAINER_MODE=1 \
    USE_SYSTEM_XXHASH=1 \
    USE_SYSTEM_OPENCL=1 \
    USE_SYSTEM_ZLIB=1 \
    install
  install -Dm 644 extra/tab_completion/${pkgname}.sh "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dm 644 docs/license.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:

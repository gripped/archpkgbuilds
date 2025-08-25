# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Sam Stuewe <halosghost at archlinux dot info>

pkgname=hashcat
pkgver=7.1.2
pkgrel=1
epoch=1
pkgdesc='Multithreaded advanced password recovery utility'
url='https://hashcat.net/hashcat'
arch=('x86_64')
depends=('ocl-icd' 'xxhash' 'zlib' 'minizip')
makedepends=('opencl-headers' 'rust')
provides=('libhashcat.so')
license=('MIT')
source=(https://hashcat.net/files/${pkgname}-${pkgver}.tar.gz{,.asc})
sha512sums=('89213058aaa2be3aa62dfab8acd5c61a7c8bd58a63ce2c3c1472960e122ca554f63482cb201f4e285acb97d94b1c1038bc93a203d66bd5a428f31ad8c709873c'
            'SKIP')
validpgpkeys=('A70833229D040B4199CC00523C17DA8B8A16544F') # Hashcat signing key <signing@hashcat.net>

build() {
  cd ${pkgname}-${pkgver}
  rm -rf deps/{OpenCL-Headers,xxHash}
  export CFLAGS+=" ${CPPFLAGS}"
  export CXXFLAGS+=" ${CPPFLAGS}"
  make \
    PREFIX=/usr \
    SHARED=1 \
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
    USE_SYSTEM_XXHASH=1 \
    USE_SYSTEM_OPENCL=1 \
    USE_SYSTEM_ZLIB=1 \
    install
  install -Dm 644 docs/license.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:

# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor:  Emanuel Schmidt <emanuel.schmidt@gmail.com>

pkgbase=xdp-tools
pkgname=(xdp-tools libxdp)
pkgver=1.5.8
pkgrel=1
pkgdesc='Utilities and example programs for use with XDP'
url='https://github.com/xdp-project/xdp-tools'
license=('GPL' 'LGPL' 'BSD2')
arch=('x86_64')
depends=('libelf' 'linux-api-headers' 'libbpf')
makedepends=('clang' 'llvm' 'gcc' 'make' 'm4' 'pkgconfig' 'libpcap' 'zlib' 'bpf')
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::https://github.com/xdp-project/xdp-tools/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('e35d91fb947ec867ade292559afa2687d6f2490ddef87c93879db66b9397b298c94018dc4ba9dac1473e460a0225544e56835e9809601d1badbcd13d37ac918b')
b2sums=('600c43bf78a4cd5874deefe125d65e96a84ebcafdb7ddf97efda73857aba85eb94ea324e0f8f62e637bff435358c6d354c5c839d7e0fecd4052b144075eaebea')


build() {
  cd "${pkgname}-${pkgver}"
  export PRODUCTION=1
  export DYNAMIC_LIBXDP=1
  export FORCE_SYSTEM_LIBBPF=1
  export PREFIX="/usr"
  ./configure
  make V=1
}

package_xdp-tools() {
  cd "${pkgname}-${pkgver}"
  pkgdesc="Utilities and example programs for use with XDP"
  depends=("libxdp" 'libpcap.so' 'libbpf')
  export DESTDIR="${pkgdir}"
  export SBINDIR="/usr/bin"
  export PREFIX="/usr"
  make install V=1

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 LICENSE LICENSES/* -t "${pkgdir}/usr/share/licenses/${pkgname}"
  rm -rf "${pkgdir}"/usr/share/xdp-tools \
         "${pkgdir}"/usr/lib/libxdp* \
         "${pkgdir}"/usr/lib/bpf/{xdp-dispatcher*,xsk_*} \
         "${pkgdir}"/usr/lib/pkgconfig \
         "${pkgdir}"/usr/include \
         "${pkgdir}"/usr/share/man/man3
}

package_libxdp() {
  cd "${pkgbase}-${pkgver}"
  pkgdesc="The libxdp package contains the libxdp library for managing XDP programs"
  provides=('libxdp.so')
  export DESTDIR="${pkgdir}"
  export SBINDIR="/usr/bin"
  export PREFIX="/usr"
  make libxdp_install V=1

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 LICENSE LICENSES/* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

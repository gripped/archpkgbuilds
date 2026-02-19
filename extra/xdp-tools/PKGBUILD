# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor:  Emanuel Schmidt <emanuel.schmidt@gmail.com>

pkgbase=xdp-tools
pkgname=(xdp-tools libxdp)
pkgver=1.6.1
pkgrel=1
pkgdesc='Utilities and example programs for use with XDP'
url='https://github.com/xdp-project/xdp-tools'
license=('GPL' 'LGPL' 'BSD2')
arch=('x86_64')
depends=('libelf' 'linux-api-headers' 'libbpf')
makedepends=('clang' 'llvm' 'gcc' 'make' 'm4' 'pkgconfig' 'libpcap' 'zlib' 'bpf')
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::https://github.com/xdp-project/xdp-tools/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('b9f7dec6175005e871017839f1ee9ad27ce2649e2364c6ad00479bdcbd60bf8b0332f5b25fb401aa1a6a65346105b7be001781b9a6e744d9481740bfe919a135')
b2sums=('28c4c6c6810647989fb7dff3ef98068fed8373da70374243bcbfcf806001d74ab28ae6dc7818cc7d6602ebefd3300383d4298f2e932bf5c488fd37907664b44b')


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

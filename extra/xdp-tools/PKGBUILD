# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor:  Emanuel Schmidt <emanuel.schmidt@gmail.com>

pkgbase=xdp-tools
pkgname=(xdp-tools libxdp)
pkgver=1.5.0
pkgrel=1
pkgdesc='Utilities and example programs for use with XDP'
url='https://github.com/xdp-project/xdp-tools'
license=('GPL' 'LGPL' 'BSD2')
arch=('x86_64')
depends=('libelf' 'linux-api-headers' 'libbpf')
makedepends=('clang' 'llvm' 'gcc' 'make' 'm4' 'pkgconfig' 'libpcap' 'zlib' 'bpf')
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::https://github.com/xdp-project/xdp-tools/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('9713280fc5d58c19f972cced614f0acdb21de0f467439af2364217ae5381963f90c9e4aba9b6de1a8fdb7fa36c1f645c42b9cd1c86a2cd60168a3b974f14c0dd')
b2sums=('41ef06c544af743a8542306af93b1d2a671e53118aa9c4230521c755868245d854ef4ed38ac47102869c18104d67808e8ede8baef45dde8811b074501fc34520')


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

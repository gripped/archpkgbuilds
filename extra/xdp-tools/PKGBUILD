# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor:  Emanuel Schmidt <emanuel.schmidt@gmail.com>

pkgbase=xdp-tools
pkgname=(xdp-tools libxdp)
pkgver=1.6.0
pkgrel=1
pkgdesc='Utilities and example programs for use with XDP'
url='https://github.com/xdp-project/xdp-tools'
license=('GPL' 'LGPL' 'BSD2')
arch=('x86_64')
depends=('libelf' 'linux-api-headers' 'libbpf')
makedepends=('clang' 'llvm' 'gcc' 'make' 'm4' 'pkgconfig' 'libpcap' 'zlib' 'bpf')
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::https://github.com/xdp-project/xdp-tools/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('9db1bc8e89ab57125f3f9be949d20852bea520e12c3d13a5b534a5a38ba3d35190d9b23903e21cb3878235ef1dabc4afff236d45f7e77d42193583c652c2db5c')
b2sums=('fc13177fe2b63dea234bc3aeabbb5af3fffd69988101f648b95e55b71f27cc2be2337f238c7054dcac40550ac9f7f90d8eb8690e40745b0888e1fa54e2de7bfb')


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

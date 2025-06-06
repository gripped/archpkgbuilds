# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor:  Emanuel Schmidt <emanuel.schmidt@gmail.com>

pkgbase=xdp-tools
pkgname=(xdp-tools libxdp)
pkgver=1.5.5
pkgrel=1
pkgdesc='Utilities and example programs for use with XDP'
url='https://github.com/xdp-project/xdp-tools'
license=('GPL' 'LGPL' 'BSD2')
arch=('x86_64')
depends=('libelf' 'linux-api-headers' 'libbpf')
makedepends=('clang' 'llvm' 'gcc' 'make' 'm4' 'pkgconfig' 'libpcap' 'zlib' 'bpf')
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::https://github.com/xdp-project/xdp-tools/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('d5bdf6e7398fde5144aec0c18bff8d0f3d2f00890106cfbc6446322a093ccbddd740a7769153f2a3caca9a1b4d8e3f3b05c218fc049d7cf6195de48a140930e9')
b2sums=('b8e7227b827f4783442e1d111902c1de8f8884e2168bb056ee2eff897f31add90d174b9904f8f03e0375059c3ddebeda52513019ee5071a94572795298b02530')


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

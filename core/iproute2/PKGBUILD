# Maintainer: Christian Hesse <mail@eworm.de>
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=iproute2
pkgver=7.0.0
pkgrel=1
pkgdesc='IP Routing Utilities'
arch=('x86_64')
license=('GPL-2.0-or-later')
url='https://git.kernel.org/pub/scm/network/iproute2/iproute2.git'
depends=('glibc'
         'libxtables.so' # from iptables or iptables-nft
         'libcap' 'libcap.so'
         'libelf'
         'libbpf' 'libbpf.so')
makedepends=('git' 'db' 'linux-atm' 'iptables')
optdepends=('db: userspace arp daemon'
            'linux-atm: ATM support'
            'python: for routel')
provides=('iproute')
options=('!emptydirs')
validpgpkeys=('9F6FC345B05BE7E766B83C8F80A77F6095CDE47E') # Stephen Hemminger
source=("git+https://git.kernel.org/pub/scm/network/${pkgname}/${pkgname}.git#tag=v${pkgver}"
        '0001-make-iproute2-fhs-compliant.patch')
sha256sums=('9be3e46124773e636799383b71edea4fb5d19283d72ad9847f167beabd71d6fc'
            '758b82bd61ed7512d215efafd5fab5ae7a28fbfa6161b85e2ce7373285e56a5d')

prepare() {
  cd "${srcdir}/${pkgname}"

  # set correct fhs structure
  patch -Np1 -i "${srcdir}"/0001-make-iproute2-fhs-compliant.patch
}

build() {
  cd "${srcdir}/${pkgname}"

  ./configure \
    --color auto
  make
}

package() {
  cd "${srcdir}/${pkgname}"

  make DESTDIR="${pkgdir}" SBINDIR="/usr/bin" install
}

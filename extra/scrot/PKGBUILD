# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Orhun Parmaksız <orhun@archlinux.org>
# Maintainer: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgname=scrot
pkgver=1.11
pkgrel=1
pkgdesc='Simple command-line screenshot utility for X'
url='https://github.com/resurrecting-open-source-projects/scrot'
arch=('x86_64')
license=('MIT')
depends=('imlib2' 'libxext' 'libxinerama' 'libxfixes' 'libxcomposite' 'libbsd')
makedepends=('autoconf-archive' 'git')
source=("git+https://github.com/resurrecting-open-source-projects/scrot.git#tag=${pkgver}")
sha512sums=('ac78d220905d0ab45e1f0e01468d2c004ad244f951e8d9a863460e32d9755c9fc1703a0205c68fb745e456e17170d028eb2cbb80b1ddd9fbf04340ad2b3ff22a')
b2sums=('f35ddaa08ba4ec4f7603218f1ad3da440ce16aeab78de0e6e93bac8e24a0958c6e3cf14ddbe3c6d3d842d47ae8debf6d30ccb1e259515daff281bf85d5a7164d')

prepare(){
  cd ${pkgname}
  autoreconf -fiv
}

build() {
  cd ${pkgname}
  ./configure \
    --prefix=/usr \
    --mandir=/usr/share/man
  make
}

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install
  install -Dm644 README.md ChangeLog -t "${pkgdir}"/usr/share/doc/${pkgname}
  install -Dm644 COPYING -t "${pkgdir}"/usr/share/licenses/${pkgname}
}

# vim: ts=2 sw=2 et:

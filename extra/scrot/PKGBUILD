# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Orhun Parmaksız <orhun@archlinux.org>
# Maintainer: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgname=scrot
pkgver=1.12
pkgrel=1
pkgdesc='Simple command-line screenshot utility for X'
url='https://github.com/resurrecting-open-source-projects/scrot'
arch=('x86_64')
license=('MIT')
depends=('imlib2' 'libxext' 'libxinerama' 'libxfixes' 'libxcomposite' 'libbsd')
makedepends=('autoconf-archive' 'git')
source=("git+https://github.com/resurrecting-open-source-projects/scrot.git#tag=${pkgver}")
sha512sums=('1e3fbe080eaad31e33959ebd9475cf72f17bbc7db86664d768c93dff138bf53ccd2cd76725c57afcc3de817583f0e52ce763a69b2a184639d6e18d260fe99872')
b2sums=('7b874d2cfee6d8c7ebaccaae9ed0a5f8713a5211e2ad37f33c77b0356f85c7ad10af118355afb5043f0ee2c2f89b3bff9ac691bd12bc0447f71064d7b734b6a2')

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

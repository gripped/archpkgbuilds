# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Sam S. <smls75@gmail.com>
# Contributor: Nuno Araujo <nuno.araujo@russo79.com>

pkgname=pmbootstrap
pkgver=3.3.1
pkgrel=1
pkgdesc='Sophisticated chroot/build/flash tool to develop and install postmarketOS'
url='https://gitlab.postmarketos.org/postmarketOS/pmbootstrap'
arch=('any')
license=('GPL-3.0-only')
depends=(
  'git'
  'multipath-tools'
  'python'
  'python-argcomplete'
  'python-tomli'
  'util-linux'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("https://gitlab.postmarketos.org/postmarketOS/pmbootstrap/-/archive/${pkgver}/pmbootstrap-${pkgver}.tar.gz")
sha256sums=('297964d1ccf1a99632f989571539b949e821548ca95ca89145b326efad579cac')
b2sums=('48f790be131a793c3ae81933d9a05d940bc5c2e0cdfd13b11d61b341247d33d61d9cfeb7d014ba7786b97b089e0e941a98484acc0d2fdb7052219a0f68dd9133')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}

# vim: ts=2 sw=2 et:

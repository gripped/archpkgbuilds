# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Sam S. <smls75@gmail.com>
# Contributor: Nuno Araujo <nuno.araujo@russo79.com>

pkgname=pmbootstrap
pkgver=2.3.3
pkgrel=1
pkgdesc='Sophisticated chroot/build/flash tool to develop and install postmarketOS'
url='https://gitlab.postmarketos.org/postmarketOS/pmbootstrap'
arch=('any')
license=('GPL-3.0-only')
depends=(
  'python'
  'python-argcomplete'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("https://gitlab.postmarketos.org/postmarketOS/pmbootstrap/-/archive/${pkgver}/pmbootstrap-${pkgver}.tar.gz")
sha256sums=('8938fd3e71187403d253b5ba90b22bcfc11e48cc44377c8ed9b6dc985d9a7935')
b2sums=('2e9a0fa449686934e1f0b97458706e92d3fb365baa4d32b62c74a5f3cac5d5871c5b46671a5fe3e1d2f167079c5e5c6fd50d9fded63f855a74d31ad0cecc43a3')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}

# vim: ts=2 sw=2 et:

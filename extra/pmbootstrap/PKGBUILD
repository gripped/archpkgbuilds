# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Sam S. <smls75@gmail.com>
# Contributor: Nuno Araujo <nuno.araujo@russo79.com>

pkgname=pmbootstrap
pkgver=3.2.0
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
sha256sums=('48554a662c8ca882c2a7d83dbe67ac831b742b7f79c8acb6c5b3e20c7271f293')
b2sums=('1768cf4323f5f7194b9e84d0ddd312363ddf4c3cfcd2d53d93909848afa8c53b5400913bc79bb617515a097134ffc0d53534aa39bf5083a394780987877102aa')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}

# vim: ts=2 sw=2 et:

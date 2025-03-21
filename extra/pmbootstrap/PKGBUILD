# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Sam S. <smls75@gmail.com>
# Contributor: Nuno Araujo <nuno.araujo@russo79.com>

pkgname=pmbootstrap
pkgver=3.3.2
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
sha256sums=('7905c0839b4e9afd581ae32aca71023bfd23ce94658daa6cf6c9b6bfd717d267')
b2sums=('6d9fd946cef316933c83b14ca20794fb9bbb0a9c8dba1c98214fbe6485e80ee5d7ad503bd74b74c540184f5395d9ac594ac3930ddf7f5b8f9997952dbb6b8d3d')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}

# vim: ts=2 sw=2 et:

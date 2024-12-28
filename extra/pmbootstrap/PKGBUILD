# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Sam S. <smls75@gmail.com>
# Contributor: Nuno Araujo <nuno.araujo@russo79.com>

pkgname=pmbootstrap
pkgver=3.1.0
pkgrel=1
pkgdesc='Sophisticated chroot/build/flash tool to develop and install postmarketOS'
url='https://gitlab.postmarketos.org/postmarketOS/pmbootstrap'
arch=('any')
license=('GPL-3.0-only')
depends=(
  'git'
  'python'
  'python-argcomplete'
  'python-tomli'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("https://gitlab.postmarketos.org/postmarketOS/pmbootstrap/-/archive/${pkgver}/pmbootstrap-${pkgver}.tar.gz")
sha256sums=('26797f7558f9a394c4b22122196f6e98e6a6979e1d18873f3c415a06a780db1d')
b2sums=('e4ceb108fb29bef7c2ec69afaa59049042cef1da4525818c0b6cec72c0f9cd034424e7faf98463617fe12c99bab7ba710718fe2e9583c761a220046b6409f1db')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}

# vim: ts=2 sw=2 et:

# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Sam S. <smls75@gmail.com>
# Contributor: Nuno Araujo <nuno.araujo@russo79.com>

pkgname=pmbootstrap
pkgver=2.2.0
pkgrel=1
pkgdesc='Sophisticated chroot/build/flash tool to develop and install postmarketOS'
url='https://gitlab.com/postmarketOS/pmbootstrap'
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
source=("https://gitlab.com/postmarketOS/pmbootstrap/-/archive/$pkgver/pmbootstrap-$pkgver.tar.gz")
sha256sums=('58235c85f3c82f3d39e40be0f40c825525e455f4f416e3f07703768a788b6205')
b2sums=('6b886f23a03c602720a0e5cf8ff45e2ae030dff489aecf41f2ec4232bfe48de140d606b12fff78c3c7d533fffc08f85dfa6beee0761bfe8d96732413cc0dfcf3')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}

# vim: ts=2 sw=2 et:

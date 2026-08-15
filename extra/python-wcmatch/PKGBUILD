# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=python-wcmatch
pkgver=11.0.1
pkgrel=1
pkgdesc='Wilcard File Name matching library'
arch=('any')
url='https://github.com/facelessuser/wcmatch'
license=('MIT')
depends=('python-bracex')
makedepends=('python-build' 'python-hatchling' 'python-installer' 'python-wheel')
source=("https://github.com/facelessuser/wcmatch/archive/${pkgver}/wcmatch-${pkgver}.tar.gz")
b2sums=('c80a055c02d0fc671fae4ef7dd291c8e58bdf91a446394a22c845a6b5c0ad9842874631f0e446b7e407d34e61a938c9e18e6925b459205b85e93bed00d42fd9d')

build() {
  cd wcmatch-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd wcmatch-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE.md "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

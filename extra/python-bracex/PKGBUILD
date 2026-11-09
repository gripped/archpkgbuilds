# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=python-bracex
pkgver=3.2.2
pkgrel=1
pkgdesc='Bash style brace expansion for Python'
arch=('any')
url='https://github.com/facelessuser/bracex'
license=('MIT')
makedepends=('python-build' 'python-hatchling' 'python-installer' 'python-wheel')
source=("https://github.com/facelessuser/bracex/archive/${pkgver}/bracex-${pkgver}.tar.gz")
b2sums=('e2835558b47d96994fb0c5283f7520b4264dd90897cfbc2d75b9c78793d5a753c6fd6517d3335382618b5532e06182b334cf18b9f278bfaaa8eb440be6d1477e')

build() {
  cd bracex-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd bracex-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE.md "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

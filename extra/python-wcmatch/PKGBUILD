# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=python-wcmatch
pkgver=11.0
pkgrel=1
pkgdesc='Wilcard File Name matching library'
arch=('any')
url='https://github.com/facelessuser/wcmatch'
license=('MIT')
depends=('python-bracex')
makedepends=('python-build' 'python-hatchling' 'python-installer' 'python-wheel')
source=("https://github.com/facelessuser/wcmatch/archive/${pkgver}/wcmatch-${pkgver}.tar.gz")
b2sums=('800a6ba2c4aefdef6f68292427fd8250e358344fd0d8720360e83a11139713c9f657bb4feddf832b97bd893acf5092f3fa354ba41ef70fe6d3791085cf6fbc7c')

build() {
  cd wcmatch-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd wcmatch-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE.md "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

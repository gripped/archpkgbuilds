# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=python-bracex
pkgver=3.0
pkgrel=1
pkgdesc='Bash style brace expansion for Python'
arch=('any')
url='https://github.com/facelessuser/bracex'
license=('MIT')
makedepends=('python-build' 'python-hatchling' 'python-installer' 'python-wheel')
source=("https://github.com/facelessuser/bracex/archive/${pkgver}/bracex-${pkgver}.tar.gz")
b2sums=('06f0394960d1fd2ef465209293431f2b9e8aeefb8d3cbdcaec23c28236cc46ff03ea96e24e4ff6ef468d4347e7b40e64f4283bf7a494acf7602ccb5d77d18f8c')

build() {
  cd bracex-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd bracex-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE.md "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

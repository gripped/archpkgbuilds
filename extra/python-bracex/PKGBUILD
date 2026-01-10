# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=python-bracex
pkgver=2.6
pkgrel=2
pkgdesc='Bash style brace expansion for Python'
arch=('any')
url='https://github.com/facelessuser/bracex'
license=('MIT')
makedepends=('python-build' 'python-hatchling' 'python-installer' 'python-wheel')
source=("https://github.com/facelessuser/bracex/archive/${pkgver}/bracex-${pkgver}.tar.gz")
b2sums=('cd7d1b1f2483d2c793fd90e9d8619373bb5c71b9ce8c2528a86c81fb68c83960387dec5717743d3947e09b8fe27e113c1f5678c4478339f0da4e51f39fe5ac3c')

build() {
  cd bracex-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd bracex-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE.md "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

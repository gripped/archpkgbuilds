# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-trove-classifiers
pkgver=2024.5.17
_commit=f04fd33328820becb5347ae57775b731b1e25edb
pkgrel=1
pkgdesc="Canonical source for classifiers on PyPI (pypi.org)"
url="https://github.com/pypa/trove-classifiers"
license=('Apache-2.0')
arch=('any')
depends=('python')
makedepends=('git' 'python-calver' 'python-setuptools' 'python-wheel' 'python-build' 'python-installer')
checkdepends=('python-pytest')
source=("git+https://github.com/pypa/trove-classifiers.git#commit=$_commit")
sha512sums=('9fd11937c77c0e684fcbc925248650defb7e7a598852b44af4f604dd1500f390f7bdd3c430f49485d2d1584d0ebbe530b104a0bdeb9b5c3822b3521f3dbc79ef')

build() {
  cd trove-classifiers
  python -m build --wheel --no-isolation
}

check() {
  cd trove-classifiers
  pytest
  PYTHONPATH="$PWD"/build/lib python -m tests.lib
}

package() {
  cd trove-classifiers
  python -m installer --destdir="$pkgdir" dist/*.whl
}

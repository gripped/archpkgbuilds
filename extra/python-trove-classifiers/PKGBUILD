# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-trove-classifiers
pkgver=2024.3.25
_commit=35fee7474825b66dbcddc000deb1348301f0ac77
pkgrel=1
pkgdesc="Canonical source for classifiers on PyPI (pypi.org)"
url="https://github.com/pypa/trove-classifiers"
license=('Apache-2.0')
arch=('any')
depends=('python')
makedepends=('git' 'python-calver' 'python-setuptools' 'python-wheel' 'python-build' 'python-installer')
checkdepends=('python-pytest')
source=("git+https://github.com/pypa/trove-classifiers.git#commit=$_commit")
sha512sums=('36c304f651d2f72d558717732ab7bd97965fbe18c1f774e3227ef3347c4c31dc40060b9ea009194b5b47f561f082032950d0f1aabaf05af90584336120c0595d')

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

# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-trove-classifiers
pkgver=2024.10.11
pkgrel=2
pkgdesc="Canonical source for classifiers on PyPI (pypi.org)"
url="https://github.com/pypa/trove-classifiers"
license=('Apache-2.0')
arch=('any')
depends=('python')
makedepends=('git' 'python-calver' 'python-setuptools' 'python-wheel' 'python-build' 'python-installer')
checkdepends=('python-pytest')
source=("git+https://github.com/pypa/trove-classifiers.git#tag=$pkgver")
sha512sums=('c27c9ebaa03ce74e823d89e8c61ed4356de9750047d2a8d6198dd0c56b5135035dc81d710136b043d4ef06d8719835bccfc53cf755491f47cc5421c299a9f46f')

prepare() {
  cd trove-classifiers
  # calver doesn't detect git tags
  echo "Version: $pkgver" > PKG-INFO
}

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

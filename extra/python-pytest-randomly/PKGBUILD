# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-randomly
pkgver=3.14.0
pkgrel=1
pkgdesc='Pytest plugin to randomly order tests and control random.seed'
arch=('any')
license=('MIT')
url='https://github.com/pytest-dev/pytest-randomly'
depends=('python-importlib-metadata' 'python-pytest')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-factory-boy' 'python-faker' 'python-numpy' 'python-pytest-xdist')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pytest-dev/pytest-randomly/archive/$pkgver.tar.gz")
sha512sums=('c088a4c4ef469fdbc1f75b9e8a0014d92256e03d4debdafcc031517c647ef16c20d5563cb0d3c4a53843f87da48c22be053ec31b1f726a3562d6ca3841002b41')

build() {
  cd pytest-randomly-$pkgver
  python -m build -nw
}

check() {
  cd pytest-randomly-$pkgver
  python -m installer -d tmp_install dist/*.whl
  # tests/test_pytest_randomly.py::test_model_bakery requires python-model-bakery which is not packaged
  # tests/test_pytest_randomly.py::test_entrypoint_injection: TODO
  PYTHONPATH="$PWD/tmp_install/usr/lib/python3.11/site-packages" \
    pytest --deselect tests/test_pytest_randomly.py::test_model_bakery \
           --deselect tests/test_pytest_randomly.py::test_entrypoint_injection
}

package() {
  cd pytest-randomly-$pkgver
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:

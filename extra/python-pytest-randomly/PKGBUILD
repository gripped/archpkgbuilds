# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-randomly
pkgver=4.0.0
pkgrel=1
pkgdesc='Pytest plugin to randomly order tests and control random.seed'
arch=('any')
license=('MIT')
url='https://github.com/pytest-dev/pytest-randomly'
depends=('python-pytest')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-factory-boy' 'python-faker' 'python-numpy' 'python-pytest-xdist')
source=("git+https://github.com/pytest-dev/pytest-randomly.git#tag=$pkgver")
sha512sums=('31b4228b31a6ce989c08a0bfb4d1014f3fda1626b523e155109c26f7504c437413b0b2e907bbd9383656d80397221ed89b6da0fc336ef781b18c3bb160ebc8ed')

build() {
  cd pytest-randomly
  python -m build -nw
}

check() {
  cd pytest-randomly
  python -m installer -d tmp_install dist/*.whl
  # tests/test_pytest_randomly.py::test_model_bakery requires python-model-bakery which is not packaged
  # tests/test_pytest_randomly.py::test_entrypoint_injection: TODO
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  PYTHONPATH="$PWD/tmp_install/usr/lib/python${python_version}/site-packages" \
    pytest --deselect tests/test_pytest_randomly.py::test_model_bakery \
           --deselect tests/test_pytest_randomly.py::test_entrypoint_injection
}

package() {
  cd pytest-randomly
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:

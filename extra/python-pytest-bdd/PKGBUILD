# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-pytest-bdd
pkgver=8.1.0
pkgrel=3
pkgdesc='BDD library for the pytest runner'
arch=('any')
license=('MIT')
url='https://github.com/pytest-dev/pytest-bdd'
depends=(
  'python'
  'python-gherkin'
  'python-mako'
  'python-packaging'
  'python-parse'
  'python-parse-type'
  'python-pluggy'
  'python-pytest'
  'python-typing_extensions'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-poetry-core'
)
checkdepends=('python-setuptools')
source=("git+$url.git#tag=$pkgver")
sha512sums=('a8b22b0b9e34469fb927c9a748214cf96b009c14a91de5afed623c7f8286f23011e2c2425a7fb98ccbc466c67eb21af21918d79d2da3bf2a7ae270410f121510')

build() {
  cd ${pkgname#python-}
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#python-}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  PATH=$PWD/test-env/bin:$PATH test-env/bin/python -m pytest \
    --override-ini="addopts=" \
    --deselect tests/parser/test_errors.py::test_step_outside_scenario_or_background_error
}

package() {
  cd ${pkgname#python-}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}

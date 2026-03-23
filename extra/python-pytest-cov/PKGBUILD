# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Sebastien LEDUC <sebastien@sleduc.fr>
# Contributor: Andrey Mikhaylenko <neithere at gmail dot com>

pkgname=python-pytest-cov
pkgver=7.0.0
pkgrel=1
pkgdesc='py.test plugin for coverage reporting with support for both centralised and distributed testing, including subprocesses and multiprocessing'
arch=('any')
license=('MIT')
url='https://github.com/pytest-dev/pytest-cov'
depends=('python-coverage' 'python-pluggy' 'python-pytest')
makedepends=('git' 'python-build' 'python-hatch-fancy-pypi-readme' 'python-hatchling' 'python-installer')
checkdepends=('python-virtualenv' 'python-process-tests' 'python-pytest-xdist')
source=("git+https://github.com/pytest-dev/pytest-cov.git#tag=v$pkgver")
sha512sums=('2dc33f1efea9ed4115c2e3738a0558bee8b62b28ce3135b00a47eeb2a85d18757208c261a47d7b2246067882025c025b79d576c2899a9a2c93f38d13c0fcc469')

build() {
  cd pytest-cov
  python -m build --wheel --no-isolation
}

check() {
  cd pytest-cov
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  PYTHONPATH="$PWD/tests" test-env/bin/python -m pytest || echo "Tests failed"
}

package() {
  cd pytest-cov
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:

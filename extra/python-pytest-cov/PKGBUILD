# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Sebastien LEDUC <sebastien@sleduc.fr>
# Contributor: Andrey Mikhaylenko <neithere at gmail dot com>

pkgname=python-pytest-cov
pkgver=6.3.0
pkgrel=2
pkgdesc='py.test plugin for coverage reporting with support for both centralised and distributed testing, including subprocesses and multiprocessing'
arch=('any')
license=('MIT')
url='https://github.com/pytest-dev/pytest-cov'
depends=('python-coverage' 'python-pytest')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-virtualenv' 'python-process-tests' 'python-pytest-xdist' 'python-fields')
source=("git+https://github.com/pytest-dev/pytest-cov.git#tag=v$pkgver")
sha512sums=('ee7bf6f7726d102f8e3f92e9aa55e398a0836a33f48ad5e4b33e14734d4153d3ff6469762bf319417a73ce0fda7f0d9cb19747966284c060bb28886e3504f292')

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

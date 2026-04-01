# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-testtools
pkgver=2.8.5
pkgrel=1
pkgdesc="Extensions to the Python standard library unit testing framework"
arch=('any')
license=('MIT')
url="https://github.com/testing-cabal/testtools"
depends=('python-setuptools')
makedepends=('git' 'python-build' 'python-installer' 'python-hatchling' 'python-hatch-vcs')
checkdepends=('python-testscenarios' 'python-testresources' 'python-fixtures' 'python-twisted')
source=("git+https://github.com/testing-cabal/testtools.git#tag=$pkgver")
sha512sums=('a0105246762abb96831b308c269a84f62d466391434c4e10c8584839bc40969f88248f7cd8a0382706c044c27de2ab14f5efa98fb2425a990325ae7c4061e9b8')

build() {
  cd testtools
  python -m build -nw
}

check() {
  cd testtools
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m testtools.run tests.test_suite
}

package() {
  cd testtools
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

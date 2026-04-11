# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-testtools
pkgver=2.9.0
pkgrel=1
pkgdesc="Extensions to the Python standard library unit testing framework"
arch=('any')
license=('MIT')
url="https://github.com/testing-cabal/testtools"
depends=('python-setuptools')
makedepends=('git' 'python-build' 'python-installer' 'python-hatchling' 'python-hatch-vcs')
checkdepends=('python-testscenarios' 'python-testresources' 'python-fixtures' 'python-twisted')
source=("git+https://github.com/testing-cabal/testtools.git#tag=$pkgver")
sha512sums=('80d94aaaad12e270507ff949ff121fada96c40e17d211c633ec6c77f759119a3b932747d8e55c93337d0ac9d7d99771a62ea54bc0fb95340eddbffa01d1aa8bc')

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

# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-testtools
pkgver=2.8.4
pkgrel=1
pkgdesc="Extensions to the Python standard library unit testing framework"
arch=('any')
license=('MIT')
url="https://github.com/testing-cabal/testtools"
depends=('python-setuptools')
makedepends=('git' 'python-build' 'python-installer' 'python-hatchling' 'python-hatch-vcs')
checkdepends=('python-testscenarios' 'python-testresources' 'python-fixtures' 'python-twisted')
source=("git+https://github.com/testing-cabal/testtools.git#tag=$pkgver")
sha512sums=('52cb0000ff7e8caba61ca95c56d4d622acc911c386f5410711acb4f8b1cde65b41486c7af80016c4b18060805aab4646f25773ad30321d06dccf59c9713a30c1')

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

# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-testtools
pkgver=2.9.2
pkgrel=1
pkgdesc="Extensions to the Python standard library unit testing framework"
arch=('any')
license=('MIT')
url="https://github.com/testing-cabal/testtools"
depends=('python-setuptools')
makedepends=('git' 'python-build' 'python-installer' 'python-hatchling' 'python-hatch-vcs')
checkdepends=('python-testscenarios' 'python-testresources' 'python-fixtures' 'python-twisted')
source=("git+https://github.com/testing-cabal/testtools.git#tag=$pkgver")
sha512sums=('a7cc017d70b2846e857e1333e22d1896a9833871a539dc2afcd84cac0dd2dc59556c29838bd674d99d9afcba290498e7d3b941846e1323e8221a90cf40b51445')

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

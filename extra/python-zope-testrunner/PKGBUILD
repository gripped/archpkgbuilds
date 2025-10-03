# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-zope-testrunner
_pkgname=zope.testrunner
pkgver=8.0
pkgrel=1
pkgdesc="Zope testrunner script"
arch=('any')
url="https://github.com/zopefoundation/zope.testrunner"
license=('ZPL-2.1')
depends=(
  'python'
  'python-setuptools'
  'python-zope-exceptions'
  'python-zope-interface'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
)
# NOTE: Causes circular dependency as python-zope-testing depends on this
# package.
checkdepends=('python-zope-testing')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('9409d1020707d384475b4e9e36b927c107ec4bb72a3edc3459688d9f2ee1f5a65069aa87eb8bc161bb39c5494a0d8c67b3037200aa697c8c674a7aad5053330e')

prepare() {
  cd $_pkgname-$pkgver
  # Remove test file with invalid Python syntax, breaks installation.
  rm src/zope/testrunner/tests/testrunner-ex/sample2/badsyntax.py
}

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  cd $_pkgname-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/zope-testrunner -vc --test-path src/
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}

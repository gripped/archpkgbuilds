# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-zope-testrunner
pkgver=8.1
pkgrel=3
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
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
)
# NOTE: Causes circular dependency as python-zope-testing depends on this
# package.
checkdepends=('python-zope-testing')
source=(
  "$pkgname::git+$url.git#tag=$pkgver"
  "$pkgname-python-3.14.patch"
)
b2sums=('30e28a825dd67eafc66e922026d189861ebbf87845727cb1c6aa08828442fa843eb578b3698bc6643e1f1fa8e6b44af70f6fd05691e74256371cda71a91e5816'
        '6727d478c37ac9c816e19099fe6a349bcc0ee9ded8bf35ca1ac70bcd8fa0210e16e8877235c6a4c91eda744a5da84a6b1b0435d1c11fcb620778f3098d28f9ff')

prepare() {
  cd $pkgname
  patch -Np1 < ../$pkgname-python-3.14.patch

  # Remove test file with invalid Python syntax, breaks installation.
  rm src/zope/testrunner/tests/testrunner-ex/sample2/badsyntax.py
}

build() {
  cd $pkgname
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  cd $pkgname
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/zope-testrunner -vc --test-path src/
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}

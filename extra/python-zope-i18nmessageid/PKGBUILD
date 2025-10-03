# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-zope-i18nmessageid
_pkgname=zope.i18nmessageid
pkgver=8.0
pkgrel=1
pkgdesc="Message Identifiers for internationalization"
arch=('x86_64')
url="https://github.com/zopefoundation/zope.i18nmessageid"
license=('ZPL-2.1')
depends=(
  'glibc'
  'python'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-zope-testrunner')
source=("$pkgname-$pkgver.tar.gz::https://github.com/zopefoundation/zope.i18nmessageid/archive/$pkgver.tar.gz")
sha512sums=('28b008364a35986549c6d2251f60593f09caf11d56f42dfffebeb1de491ec5756214d0af641c3cc9b8baf2b9c474fceb27e76ce753679091ee90d353ede29746')

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  cd $_pkgname-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m zope.testrunner -vc --test-path src/
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}

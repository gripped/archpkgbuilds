# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-zope-schema
_pkgname=zope.schema
pkgver=8.0
pkgrel=1
pkgdesc="zope.interface extension for defining data schemas"
arch=('any')
url="https://github.com/zopefoundation/zope.schema"
license=('ZPL-2.1')
depends=(
  'python'
  'python-zope-event'
  'python-zope-interface'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-zope-i18nmessageid'
  'python-zope-testing'
  'python-zope-testrunner'
)
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('bf4bf5bae9c570eaa1dee7c55acac21e23a89a945b1b6d1865ed2566ebfe9d0e98b77e1bee5654bea969eca6c9dbf011ebaa9d8da375974b5b2d321b893a0737')

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

# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-zope-hookable
_pkgname=zope.hookable
pkgver=8.0
pkgrel=1
pkgdesc="Represents the core of the Zope hookable Architecture"
arch=('x86_64')
url="https://github.com/zopefoundation/zope.hookable"
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('c8ccc0c095515968a98011d25b7c25cb1aab646ffc2736b18ecba5458da5233bb8d9681eff19dd3bca18bd23662e9a4eb52ba26c12dfac03eb9754d0bde88fe2')

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

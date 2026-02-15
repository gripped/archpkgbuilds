# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-zope-deferredimport
_pkgname=zope.deferredimport
pkgver=6.1
pkgrel=1
pkgdesc="Allows you to perform imports names that will only be resolved when used in the code"
arch=('any')
url="https://github.com/zopefoundation/zope.deferredimport"
license=('ZPL-2.1')
depends=(
  'python'
  'python-zope-proxy'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-zope-testrunner')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('8fb31ce3a916897f4b6437fc311d8bfc4bfc3b1f3b9a9770b5234236ebf2090ff68abb10b985960bd65e31d41b89f29e90de5936acea50ff726535a79ae707b9')

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

# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-zope-location
_pkgname=zope.location
pkgver=5.0
pkgrel=4
pkgdesc="Special objects that have a structural location"
arch=('any')
url="https://github.com/zopefoundation/zope.location"
license=('ZPL-2.1')
depends=(
  'python'
  'python-zope-interface'
  'python-zope-proxy'
  'python-zope-schema'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-zope-component'
  'python-zope-configuration'
  'python-zope-copy'
  'python-zope-testrunner'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/zopefoundation/zope.location/archive/$pkgver.tar.gz")
sha512sums=('4a3f41d4170730295b7b303eb9ca15304c35c05ed5fa62de8c92479011a82fe003d863d27136287394c0a04d7bb7959940fe605db5123d6c4953dada2d8ea92b')

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname-$pkgver
  PYTHONPATH="$PWD/build/lib:$PYTHONPATH" python -m zope.testrunner --test-path=src
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:

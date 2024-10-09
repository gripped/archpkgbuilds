# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-zope-copy
_pkgname=zope.copy
pkgver=4.3
pkgrel=4
pkgdesc="Pluggable object copying mechanism"
arch=('any')
url="https://github.com/zopefoundation/zope.copy"
license=('ZPL-2.1')
depends=(
  'python'
  'python-zope-interface'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-zope-location'
  'python-zope-testing'
  'python-zope-testrunner'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/zopefoundation/zope.copy/archive/$pkgver.tar.gz")
sha512sums=('ca9acf3fb65677ee123a4e1f3cd01051330ecde62f22528ff7aef719e0c60936e9a19c260f461e1aa17a280b43389198bbab85f94f52827e9762e60f65560360')

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname-$pkgver
  PYTHONPATH="$PWD/build/lib:$PYTHONPATH" zope-testrunner --test-path=src
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:

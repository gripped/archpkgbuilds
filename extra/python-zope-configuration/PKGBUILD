# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-zope-configuration
_pkgname=zope.configuration
pkgver=5.0.1
pkgrel=3
pkgdesc="Zope Configuration Markup Language (ZCML)"
arch=('any')
url="https://github.com/zopefoundation/zope.configuration"
license=('ZPL-2.1')
depends=(
  'python'
  'python-zope-i18nmessageid'
  'python-zope-interface'
  'python-zope-schema'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-zope-testing'
  'python-zope-testrunner'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/zopefoundation/zope.configuration/archive/$pkgver.tar.gz")
sha512sums=('5fe39699851be8de2d69379ed11fbf5365b4c2cc790b1c8a2a82a2239e9516ad8a421a2e84fe1c034023927efefc211beabcda8aa1e0ad5643e374d74158f676')

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname-$pkgver
  PYTHONPATH="$PWD/build/lib" zope-testrunner --test-path=src
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:

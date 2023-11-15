# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-zope-exceptions
pkgver=5.0
pkgrel=1
pkgdesc="Generic exceptions and implementations for Zope"
arch=('any')
url="https://github.com/zopefoundation/zope.exceptions"
license=('ZPL')
depends=('python-setuptools' 'python-zope-interface')
makedepends=('python-setuptools' 'python-zope-interface')
checkdepends=('python-zope-testrunner')
source=("$pkgname-$pkgver.tar.gz::https://github.com/zopefoundation/zope.exceptions/archive/$pkgver.tar.gz")
sha512sums=('b98765ad7ea55c3bedb13e57bd4d6ad1f4eb1196fe6464f5591841e91391ef1f88f3e07569471d2000f2f0d55fc0fc2e8dfd0da2d9d50d7bd4103030428ab784')

build() {
  cd zope.exceptions-$pkgver
  python setup.py build
}

check() {
  cd zope.exceptions-$pkgver
  PYTHONPATH="$PWD/build/lib" zope-testrunner --test-path=src
}

package() {
  cd zope.exceptions-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:

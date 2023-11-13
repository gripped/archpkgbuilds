# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-responses
pkgver=0.24.0
pkgrel=1
pkgdesc='A utility library for mocking out the `requests` Python library.'
arch=('any')
license=('Apache')
url='https://github.com/getsentry/responses'
depends=('python-requests' 'python-urllib3' 'python-yaml')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-pytest-httpserver' 'python-tomli'
              'python-tomli-w')
source=("https://github.com/getsentry/responses/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('78564064aef21f737e682d4f78f30a58e1ac7df666f89e458d3e0e8cd2c674cc5fdb352d5a535a8f7d1ba2a18ed67735722b0cbc3582d111815937d07929f1c5')

build() {
  cd responses-$pkgver
  python setup.py build
}

check() {
  cd responses-$pkgver
  pytest
}

package() {
  cd responses-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:

# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-responses
pkgver=0.25.6
pkgrel=1
pkgdesc='A utility library for mocking out the `requests` Python library.'
arch=('any')
license=('Apache')
url='https://github.com/getsentry/responses'
depends=('python-requests' 'python-urllib3' 'python-yaml')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-pytest-httpserver'
              'python-tomli-w')
source=("git+https://github.com/getsentry/responses.git#tag=$pkgver")
sha512sums=('8a6308a81ea8b67058841016fff75d0f42a48689abb5683b297aafbafa8c3714869b1cdf25bd9ba97f4c8a439b5de2b284a92eadb856ee71f8a81c0572b379b1')

build() {
  cd responses
  python -m build -nw
}

check() {
  cd responses
  pytest
}

package() {
  cd responses
  python -m installer -d "$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:

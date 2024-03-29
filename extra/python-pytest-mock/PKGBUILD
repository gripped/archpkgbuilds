# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-mock
pkgver=3.13.0
pkgrel=1
pkgdesc="Thin-wrapper around the mock package for easier use with py.test"
arch=('any')
license=('LGPL3')
url="https://github.com/pytest-dev/pytest-mock/"
depends=('python-pytest')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel'
             'python-setuptools-scm')
checkdepends=('python-pytest-asyncio')
source=("git+https://github.com/pytest-dev/pytest-mock.git#tag=v$pkgver")
sha512sums=('72845078a72a8446094fad84b7da69b3ff2ebc6ba1c39210943e4deeb7dc05e0ef9680875a2b991c08fe1d892ab011c9a67f585d1446bdb7fd23dc3ddde09323')

build() {
  cd pytest-mock
  python -m build -nw
}

check() {
  cd pytest-mock
  python -m venv tmpenv --system-site-packages
  tmpenv/bin/python -m installer dist/*.whl
  tmpenv/bin/python -m pytest
}

package() {
  cd pytest-mock
  python -m installer -d "$pkgdir" dist/*.whl
}

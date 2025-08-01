# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-testfixtures
pkgver=9.0.0
pkgrel=1
pkgdesc="A collection of helpers and mock objects that are useful when writing unit tests or doc tests"
arch=('any')
license=('MIT')
url="https://github.com/Simplistix/testfixtures"
depends=('python')
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest' 'python-zope-component' 'python-sybil'
              'python-pytest-django' 'python-django' 'python-twisted')
source=("git+https://github.com/Simplistix/testfixtures.git#tag=$pkgver")
sha512sums=('9704124aa80c532f316e89e134991e1f001a8917bd3a7ea246dd72f5709c6b4cad3e1565a6db6d337d268c73c5a602efae28b8b4e01b60e4eccd617d01ce9fa9')

build() {
  cd testfixtures
  python setup.py build
}

check() {
  cd testfixtures
  PYTHONPATH="$PWD" pytest --ignore=build
}

package() {
  cd testfixtures
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 docs/license.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}

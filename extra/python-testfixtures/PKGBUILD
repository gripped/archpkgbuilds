# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-testfixtures
pkgver=9.0.1
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
sha512sums=('25ae83989a3c7fe5db8dffe9b658456714f3dff4e1bc1599ba108db284b654f1f39047b6048237aaa75419484b3528857091ee966b346560bd43176bb6abfe78')

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

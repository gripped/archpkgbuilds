# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Simon Sapin <simon dot sapin at exyr dot org>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=python-scripttest
pkgver=2.0
pkgrel=3
pkgdesc="Utilities to help with testing command line scripts"
url="https://github.com/pypa/scripttest"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest')
source=("git+https://github.com/pypa/scripttest.git#tag=$pkgver")
sha512sums=('58ea691fdba0adacd929663e4f9dee5c085ca3bf5ae210127a2688745a29847f0e158c7d12e5436e757bf900a561d50661567e97578a580fcba7c663e1aecfbb')

build() {
  cd scripttest
  python -m build --wheel --no-isolation
}

check() {
  cd scripttest
  pytest
}

package() {
  cd scripttest
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 docs/license.rst -t "$pkgdir"/usr/share/licenses/$pkgname/
}

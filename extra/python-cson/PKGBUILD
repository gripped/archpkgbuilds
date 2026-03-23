# Maintainer: Rémy Oudompheng <remy@archlinux.org>

pkgname=python-cson
pkgver=0.8
pkgrel=11
pkgdesc="A Python parser for Coffeescript Object Notation (CSON)"
arch=('any')
url="https://github.com/avakar/pycson"
license=('MIT')
makedepends=('git'
             'python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel'
             'python-pytest'
             'python-speg')
depends=('python' 'python-speg')
_commit=d2ed07d980382e44726cf3c074957e752ef6441b
source=("git+https://github.com/avakar/pycson.git#tag=${_commit}")
sha256sums=('f957146918a0c2245346f2da63a95cf2e5ca636707287ed59df1e241161b8461')

build() {
  cd "$srcdir"/pycson
  python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir"/pycson
  PYTHONPATH=. py.test
}

package() {
  cd "$srcdir"/pycson
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
